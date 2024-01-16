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

import 'package:fixnum/fixnum.dart' as $fixnum;
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

class NotifierStandardReturn extends $pb.GeneratedMessage {
  factory NotifierStandardReturn({
    $fixnum.Int64? code,
    $core.String? message,
  }) {
    final $result = create();
    if (code != null) {
      $result.code = code;
    }
    if (message != null) {
      $result.message = message;
    }
    return $result;
  }
  NotifierStandardReturn._() : super();
  factory NotifierStandardReturn.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NotifierStandardReturn.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'NotifierStandardReturn', package: const $pb.PackageName(_omitMessageNames ? '' : 'grpcgen'), createEmptyInstance: create)
    ..a<$fixnum.Int64>(1, _omitFieldNames ? '' : 'Code', $pb.PbFieldType.OU6, protoName: 'Code', defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOS(2, _omitFieldNames ? '' : 'Message', protoName: 'Message')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NotifierStandardReturn clone() => NotifierStandardReturn()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NotifierStandardReturn copyWith(void Function(NotifierStandardReturn) updates) => super.copyWith((message) => updates(message as NotifierStandardReturn)) as NotifierStandardReturn;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NotifierStandardReturn create() => NotifierStandardReturn._();
  NotifierStandardReturn createEmptyInstance() => create();
  static $pb.PbList<NotifierStandardReturn> createRepeated() => $pb.PbList<NotifierStandardReturn>();
  @$core.pragma('dart2js:noInline')
  static NotifierStandardReturn getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NotifierStandardReturn>(create);
  static NotifierStandardReturn? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get code => $_getI64(0);
  @$pb.TagNumber(1)
  set code($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);
}

class ChangeState extends $pb.GeneratedMessage {
  factory ChangeState({
    $core.String? comp,
    $core.String? field_2,
    $core.String? action,
    $core.String? value,
  }) {
    final $result = create();
    if (comp != null) {
      $result.comp = comp;
    }
    if (field_2 != null) {
      $result.field_2 = field_2;
    }
    if (action != null) {
      $result.action = action;
    }
    if (value != null) {
      $result.value = value;
    }
    return $result;
  }
  ChangeState._() : super();
  factory ChangeState.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChangeState.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChangeState', package: const $pb.PackageName(_omitMessageNames ? '' : 'grpcgen'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'Comp', protoName: 'Comp')
    ..aOS(2, _omitFieldNames ? '' : 'Field', protoName: 'Field')
    ..aOS(3, _omitFieldNames ? '' : 'Action', protoName: 'Action')
    ..aOS(4, _omitFieldNames ? '' : 'Value', protoName: 'Value')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChangeState clone() => ChangeState()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChangeState copyWith(void Function(ChangeState) updates) => super.copyWith((message) => updates(message as ChangeState)) as ChangeState;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChangeState create() => ChangeState._();
  ChangeState createEmptyInstance() => create();
  static $pb.PbList<ChangeState> createRepeated() => $pb.PbList<ChangeState>();
  @$core.pragma('dart2js:noInline')
  static ChangeState getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChangeState>(create);
  static ChangeState? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get comp => $_getSZ(0);
  @$pb.TagNumber(1)
  set comp($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasComp() => $_has(0);
  @$pb.TagNumber(1)
  void clearComp() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get field_2 => $_getSZ(1);
  @$pb.TagNumber(2)
  set field_2($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasField_2() => $_has(1);
  @$pb.TagNumber(2)
  void clearField_2() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get action => $_getSZ(2);
  @$pb.TagNumber(3)
  set action($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAction() => $_has(2);
  @$pb.TagNumber(3)
  void clearAction() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get value => $_getSZ(3);
  @$pb.TagNumber(4)
  set value($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasValue() => $_has(3);
  @$pb.TagNumber(4)
  void clearValue() => clearField(4);
}

class SaveLocal extends $pb.GeneratedMessage {
  factory SaveLocal({
    $core.String? key,
    $core.String? value,
  }) {
    final $result = create();
    if (key != null) {
      $result.key = key;
    }
    if (value != null) {
      $result.value = value;
    }
    return $result;
  }
  SaveLocal._() : super();
  factory SaveLocal.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SaveLocal.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SaveLocal', package: const $pb.PackageName(_omitMessageNames ? '' : 'grpcgen'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'Key', protoName: 'Key')
    ..aOS(2, _omitFieldNames ? '' : 'Value', protoName: 'Value')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SaveLocal clone() => SaveLocal()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SaveLocal copyWith(void Function(SaveLocal) updates) => super.copyWith((message) => updates(message as SaveLocal)) as SaveLocal;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SaveLocal create() => SaveLocal._();
  SaveLocal createEmptyInstance() => create();
  static $pb.PbList<SaveLocal> createRepeated() => $pb.PbList<SaveLocal>();
  @$core.pragma('dart2js:noInline')
  static SaveLocal getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SaveLocal>(create);
  static SaveLocal? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get key => $_getSZ(0);
  @$pb.TagNumber(1)
  set key($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasKey() => $_has(0);
  @$pb.TagNumber(1)
  void clearKey() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get value => $_getSZ(1);
  @$pb.TagNumber(2)
  set value($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => clearField(2);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
