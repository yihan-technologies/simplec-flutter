//
//  Generated code. Do not modify.
//  source: public.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Transfer extends $pb.GeneratedMessage {
  factory Transfer({
    $core.Map<$core.String, CTXSingle>? cTX,
    $core.String? iNS,
    $core.Map<$core.String, $core.String>? cRED,
    $core.Iterable<TransferSingle>? oBJS,
    $core.String? eRR,
  }) {
    final $result = create();
    if (cTX != null) {
      $result.cTX.addAll(cTX);
    }
    if (iNS != null) {
      $result.iNS = iNS;
    }
    if (cRED != null) {
      $result.cRED.addAll(cRED);
    }
    if (oBJS != null) {
      $result.oBJS.addAll(oBJS);
    }
    if (eRR != null) {
      $result.eRR = eRR;
    }
    return $result;
  }
  Transfer._() : super();
  factory Transfer.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Transfer.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Transfer', package: const $pb.PackageName(_omitMessageNames ? '' : 'grpcgen'), createEmptyInstance: create)
    ..m<$core.String, CTXSingle>(1, _omitFieldNames ? '' : 'CTX', protoName: 'CTX', entryClassName: 'Transfer.CTXEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OM, valueCreator: CTXSingle.create, valueDefaultOrMaker: CTXSingle.getDefault, packageName: const $pb.PackageName('grpcgen'))
    ..aOS(2, _omitFieldNames ? '' : 'INS', protoName: 'INS')
    ..m<$core.String, $core.String>(3, _omitFieldNames ? '' : 'CRED', protoName: 'CRED', entryClassName: 'Transfer.CREDEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('grpcgen'))
    ..pc<TransferSingle>(4, _omitFieldNames ? '' : 'OBJS', $pb.PbFieldType.PM, protoName: 'OBJS', subBuilder: TransferSingle.create)
    ..aOS(5, _omitFieldNames ? '' : 'ERR', protoName: 'ERR')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Transfer clone() => Transfer()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Transfer copyWith(void Function(Transfer) updates) => super.copyWith((message) => updates(message as Transfer)) as Transfer;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Transfer create() => Transfer._();
  Transfer createEmptyInstance() => create();
  static $pb.PbList<Transfer> createRepeated() => $pb.PbList<Transfer>();
  @$core.pragma('dart2js:noInline')
  static Transfer getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Transfer>(create);
  static Transfer? _defaultInstance;

  @$pb.TagNumber(1)
  $core.Map<$core.String, CTXSingle> get cTX => $_getMap(0);

  @$pb.TagNumber(2)
  $core.String get iNS => $_getSZ(1);
  @$pb.TagNumber(2)
  set iNS($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasINS() => $_has(1);
  @$pb.TagNumber(2)
  void clearINS() => clearField(2);

  @$pb.TagNumber(3)
  $core.Map<$core.String, $core.String> get cRED => $_getMap(2);

  @$pb.TagNumber(4)
  $core.List<TransferSingle> get oBJS => $_getList(3);

  @$pb.TagNumber(5)
  $core.String get eRR => $_getSZ(4);
  @$pb.TagNumber(5)
  set eRR($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasERR() => $_has(4);
  @$pb.TagNumber(5)
  void clearERR() => clearField(5);
}

class CTXSingle extends $pb.GeneratedMessage {
  factory CTXSingle({
    $core.Map<$core.String, $core.String>? cTX,
  }) {
    final $result = create();
    if (cTX != null) {
      $result.cTX.addAll(cTX);
    }
    return $result;
  }
  CTXSingle._() : super();
  factory CTXSingle.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CTXSingle.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CTXSingle', package: const $pb.PackageName(_omitMessageNames ? '' : 'grpcgen'), createEmptyInstance: create)
    ..m<$core.String, $core.String>(1, _omitFieldNames ? '' : 'CTX', protoName: 'CTX', entryClassName: 'CTXSingle.CTXEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('grpcgen'))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CTXSingle clone() => CTXSingle()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CTXSingle copyWith(void Function(CTXSingle) updates) => super.copyWith((message) => updates(message as CTXSingle)) as CTXSingle;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CTXSingle create() => CTXSingle._();
  CTXSingle createEmptyInstance() => create();
  static $pb.PbList<CTXSingle> createRepeated() => $pb.PbList<CTXSingle>();
  @$core.pragma('dart2js:noInline')
  static CTXSingle getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CTXSingle>(create);
  static CTXSingle? _defaultInstance;

  @$pb.TagNumber(1)
  $core.Map<$core.String, $core.String> get cTX => $_getMap(0);
}

class TransferSingle extends $pb.GeneratedMessage {
  factory TransferSingle({
    $core.String? iNS,
    $core.List<$core.int>? dATA,
    $core.String? eRR,
    $core.String? iD,
  }) {
    final $result = create();
    if (iNS != null) {
      $result.iNS = iNS;
    }
    if (dATA != null) {
      $result.dATA = dATA;
    }
    if (eRR != null) {
      $result.eRR = eRR;
    }
    if (iD != null) {
      $result.iD = iD;
    }
    return $result;
  }
  TransferSingle._() : super();
  factory TransferSingle.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TransferSingle.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TransferSingle', package: const $pb.PackageName(_omitMessageNames ? '' : 'grpcgen'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'INS', protoName: 'INS')
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'DATA', $pb.PbFieldType.OY, protoName: 'DATA')
    ..aOS(3, _omitFieldNames ? '' : 'ERR', protoName: 'ERR')
    ..aOS(4, _omitFieldNames ? '' : 'ID', protoName: 'ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TransferSingle clone() => TransferSingle()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TransferSingle copyWith(void Function(TransferSingle) updates) => super.copyWith((message) => updates(message as TransferSingle)) as TransferSingle;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TransferSingle create() => TransferSingle._();
  TransferSingle createEmptyInstance() => create();
  static $pb.PbList<TransferSingle> createRepeated() => $pb.PbList<TransferSingle>();
  @$core.pragma('dart2js:noInline')
  static TransferSingle getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TransferSingle>(create);
  static TransferSingle? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get iNS => $_getSZ(0);
  @$pb.TagNumber(1)
  set iNS($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasINS() => $_has(0);
  @$pb.TagNumber(1)
  void clearINS() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get dATA => $_getN(1);
  @$pb.TagNumber(2)
  set dATA($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDATA() => $_has(1);
  @$pb.TagNumber(2)
  void clearDATA() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get eRR => $_getSZ(2);
  @$pb.TagNumber(3)
  set eRR($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasERR() => $_has(2);
  @$pb.TagNumber(3)
  void clearERR() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get iD => $_getSZ(3);
  @$pb.TagNumber(4)
  set iD($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasID() => $_has(3);
  @$pb.TagNumber(4)
  void clearID() => clearField(4);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
