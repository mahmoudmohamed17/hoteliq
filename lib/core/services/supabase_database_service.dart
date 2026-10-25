import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

typedef Json = Map<String, dynamic>;

@lazySingleton
class SupabaseDatabaseService {
  final SupabaseClient _client;
  const new(this._client);

  /// Applies optional filters. All of them are ANDed together.
  PostgrestFilterBuilder<T> _applyFilters<T>(
    PostgrestFilterBuilder<T> query, {
    Map<String, Object>? eq,
    Map<String, List<Object>>? inFilters,
    Map<String, String>? ilike,
  }) {
    var q = query;
    eq?.forEach((column, value) => q = q.eq(column, value));
    inFilters?.forEach((column, values) => q = q.inFilter(column, values));
    ilike?.forEach((column, pattern) => q = q.ilike(column, pattern));
    return q;
  }

  /// Fetch many rows.
  Future<List<Json>> getAll(
    String table, {
    String columns = '*',
    Map<String, Object>? eq,
    Map<String, List<Object>>? inFilters,
    Map<String, String>? ilike, // e.g. {'city': '%cairo%'}
    String? orderBy,
    bool ascending = true,
    int? limit,
    int? offset,
  }) async {
    final filtered = _applyFilters(
      _client.from(table).select(columns),
      eq: eq,
      inFilters: inFilters,
      ilike: ilike,
    );

    PostgrestTransformBuilder<PostgrestList> query = filtered;
    if (orderBy != null) query = query.order(orderBy, ascending: ascending);

    if (limit != null && offset != null) {
      query = query.range(offset, offset + limit - 1);
    } else if (limit != null) {
      query = query.limit(limit);
    }

    return await query;
  }

  /// Fetch one row by its id (or null if not found).
  Future<Json?> getById(
    String table,
    Object id, {
    String idColumn = 'id',
    String columns = '*',
  }) {
    return _client.from(table).select(columns).eq(idColumn, id).maybeSingle();
  }

  /// Insert one row and return it.
  Future<Json> insert(String table, Json data) {
    return _client.from(table).insert(data).select().single();
  }

  /// Insert many rows and return them.
  Future<List<Json>> insertMany(String table, List<Json> rows) {
    return _client.from(table).insert(rows).select();
  }

  /// Insert or update on conflict.
  Future<Json> upsert(
    String table,
    Json data, {
    String? onConflict, // e.g. 'user_id,hotel_id'
  }) {
    return _client.from(table).upsert(data, onConflict: onConflict).select().single();
  }

  /// Update rows matching [eq]. Returns the updated rows.
  Future<List<Json>> update(
    String table,
    Json data, {
    required Map<String, Object> eq,
  }) {
    _assertHasFilter(eq, 'update');
    return _applyFilters(_client.from(table).update(data), eq: eq).select();
  }

  /// Update a single row by id.
  Future<Json> updateById(
    String table,
    Object id,
    Json data, {
    String idColumn = 'id',
  }) {
    return _client.from(table).update(data).eq(idColumn, id).select().single();
  }

  /// Delete rows matching [eq].
  Future<void> delete(
    String table, {
    required Map<String, Object> eq,
  }) async {
    _assertHasFilter(eq, 'delete');
    await _applyFilters(_client.from(table).delete(), eq: eq);
  }

  Future<void> deleteById(
    String table,
    Object id, {
    String idColumn = 'id',
  }) async {
    await _client.from(table).delete().eq(idColumn, id);
  }

  void _assertHasFilter(Map<String, Object> eq, String op) {
    if (eq.isEmpty) {
      throw ArgumentError('Refusing to $op without at least one filter.');
    }
  }
}
