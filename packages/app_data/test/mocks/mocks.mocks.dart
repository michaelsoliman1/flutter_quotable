// Mocks generated by Mockito 5.4.4 from annotations
// in app_data/test/mocks/mocks.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:app_data/src/services/http/http_service.dart' as _i3;
import 'package:app_data/src/services/http/models/response/server_response.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeServerResponse_0 extends _i1.SmartFake
    implements _i2.ServerResponse {
  _FakeServerResponse_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeServerPageResponse_1 extends _i1.SmartFake
    implements _i2.ServerPageResponse {
  _FakeServerPageResponse_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [HttpService].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpService extends _i1.Mock implements _i3.HttpService {
  MockHttpService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.ServerResponse> request({
    required String? url,
    required _i3.Method? method,
    Map<String, dynamic>? queryParameters,
    dynamic body,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #request,
          [],
          {
            #url: url,
            #method: method,
            #queryParameters: queryParameters,
            #body: body,
          },
        ),
        returnValue: _i4.Future<_i2.ServerResponse>.value(_FakeServerResponse_0(
          this,
          Invocation.method(
            #request,
            [],
            {
              #url: url,
              #method: method,
              #queryParameters: queryParameters,
              #body: body,
            },
          ),
        )),
      ) as _i4.Future<_i2.ServerResponse>);

  @override
  _i4.Future<_i2.ServerPageResponse> requestPage(
    String? url, {
    int? pageIndex = 1,
    int? limit = 20,
    Map<String, dynamic>? queryParameters,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #requestPage,
          [url],
          {
            #pageIndex: pageIndex,
            #limit: limit,
            #queryParameters: queryParameters,
          },
        ),
        returnValue:
            _i4.Future<_i2.ServerPageResponse>.value(_FakeServerPageResponse_1(
          this,
          Invocation.method(
            #requestPage,
            [url],
            {
              #pageIndex: pageIndex,
              #limit: limit,
              #queryParameters: queryParameters,
            },
          ),
        )),
      ) as _i4.Future<_i2.ServerPageResponse>);

  @override
  _i4.Future<_i2.ServerResponse> get(
    String? url, {
    Map<String, dynamic>? queryParameters,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [url],
          {#queryParameters: queryParameters},
        ),
        returnValue: _i4.Future<_i2.ServerResponse>.value(_FakeServerResponse_0(
          this,
          Invocation.method(
            #get,
            [url],
            {#queryParameters: queryParameters},
          ),
        )),
      ) as _i4.Future<_i2.ServerResponse>);

  @override
  _i4.Future<_i2.ServerResponse> post(
    String? url, {
    dynamic body,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #post,
          [url],
          {#body: body},
        ),
        returnValue: _i4.Future<_i2.ServerResponse>.value(_FakeServerResponse_0(
          this,
          Invocation.method(
            #post,
            [url],
            {#body: body},
          ),
        )),
      ) as _i4.Future<_i2.ServerResponse>);

  @override
  _i4.Future<_i2.ServerResponse> put(
    String? url, {
    dynamic body,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #put,
          [url],
          {#body: body},
        ),
        returnValue: _i4.Future<_i2.ServerResponse>.value(_FakeServerResponse_0(
          this,
          Invocation.method(
            #put,
            [url],
            {#body: body},
          ),
        )),
      ) as _i4.Future<_i2.ServerResponse>);

  @override
  _i4.Future<_i2.ServerResponse> delete(String? url) => (super.noSuchMethod(
        Invocation.method(
          #delete,
          [url],
        ),
        returnValue: _i4.Future<_i2.ServerResponse>.value(_FakeServerResponse_0(
          this,
          Invocation.method(
            #delete,
            [url],
          ),
        )),
      ) as _i4.Future<_i2.ServerResponse>);
}
