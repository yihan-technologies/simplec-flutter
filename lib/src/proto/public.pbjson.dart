//
//  Generated code. Do not modify.
//  source: public.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use transferDescriptor instead')
const Transfer$json = {
  '1': 'Transfer',
  '2': [
    {'1': 'CTX', '3': 1, '4': 3, '5': 11, '6': '.grpcgen.Transfer.CTXEntry', '10': 'CTX'},
    {'1': 'INS', '3': 2, '4': 1, '5': 9, '10': 'INS'},
    {'1': 'CRED', '3': 3, '4': 3, '5': 11, '6': '.grpcgen.Transfer.CREDEntry', '10': 'CRED'},
    {'1': 'OBJS', '3': 4, '4': 3, '5': 11, '6': '.grpcgen.TransferSingle', '10': 'OBJS'},
    {'1': 'ERR', '3': 5, '4': 1, '5': 9, '10': 'ERR'},
  ],
  '3': [Transfer_CTXEntry$json, Transfer_CREDEntry$json],
};

@$core.Deprecated('Use transferDescriptor instead')
const Transfer_CTXEntry$json = {
  '1': 'CTXEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.grpcgen.CTXSingle', '10': 'value'},
  ],
  '7': {'7': true},
};

@$core.Deprecated('Use transferDescriptor instead')
const Transfer_CREDEntry$json = {
  '1': 'CREDEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `Transfer`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transferDescriptor = $convert.base64Decode(
    'CghUcmFuc2ZlchIsCgNDVFgYASADKAsyGi5ncnBjZ2VuLlRyYW5zZmVyLkNUWEVudHJ5UgNDVF'
    'gSEAoDSU5TGAIgASgJUgNJTlMSLwoEQ1JFRBgDIAMoCzIbLmdycGNnZW4uVHJhbnNmZXIuQ1JF'
    'REVudHJ5UgRDUkVEEisKBE9CSlMYBCADKAsyFy5ncnBjZ2VuLlRyYW5zZmVyU2luZ2xlUgRPQk'
    'pTEhAKA0VSUhgFIAEoCVIDRVJSGkoKCENUWEVudHJ5EhAKA2tleRgBIAEoCVIDa2V5EigKBXZh'
    'bHVlGAIgASgLMhIuZ3JwY2dlbi5DVFhTaW5nbGVSBXZhbHVlOgI4ARo3CglDUkVERW50cnkSEA'
    'oDa2V5GAEgASgJUgNrZXkSFAoFdmFsdWUYAiABKAlSBXZhbHVlOgI4AQ==');

@$core.Deprecated('Use cTXSingleDescriptor instead')
const CTXSingle$json = {
  '1': 'CTXSingle',
  '2': [
    {'1': 'CTX', '3': 1, '4': 3, '5': 11, '6': '.grpcgen.CTXSingle.CTXEntry', '10': 'CTX'},
  ],
  '3': [CTXSingle_CTXEntry$json],
};

@$core.Deprecated('Use cTXSingleDescriptor instead')
const CTXSingle_CTXEntry$json = {
  '1': 'CTXEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `CTXSingle`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cTXSingleDescriptor = $convert.base64Decode(
    'CglDVFhTaW5nbGUSLQoDQ1RYGAEgAygLMhsuZ3JwY2dlbi5DVFhTaW5nbGUuQ1RYRW50cnlSA0'
    'NUWBo2CghDVFhFbnRyeRIQCgNrZXkYASABKAlSA2tleRIUCgV2YWx1ZRgCIAEoCVIFdmFsdWU6'
    'AjgB');

@$core.Deprecated('Use transferSingleDescriptor instead')
const TransferSingle$json = {
  '1': 'TransferSingle',
  '2': [
    {'1': 'INS', '3': 1, '4': 1, '5': 9, '10': 'INS'},
    {'1': 'DATA', '3': 2, '4': 1, '5': 12, '10': 'DATA'},
    {'1': 'ERR', '3': 3, '4': 1, '5': 9, '10': 'ERR'},
    {'1': 'ID', '3': 4, '4': 1, '5': 9, '10': 'ID'},
  ],
};

/// Descriptor for `TransferSingle`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transferSingleDescriptor = $convert.base64Decode(
    'Cg5UcmFuc2ZlclNpbmdsZRIQCgNJTlMYASABKAlSA0lOUxISCgREQVRBGAIgASgMUgREQVRBEh'
    'AKA0VSUhgDIAEoCVIDRVJSEg4KAklEGAQgASgJUgJJRA==');

@$core.Deprecated('Use notifierStandardReturnDescriptor instead')
const NotifierStandardReturn$json = {
  '1': 'NotifierStandardReturn',
  '2': [
    {'1': 'Code', '3': 1, '4': 1, '5': 4, '10': 'Code'},
    {'1': 'Message', '3': 2, '4': 1, '5': 9, '10': 'Message'},
  ],
};

/// Descriptor for `NotifierStandardReturn`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List notifierStandardReturnDescriptor = $convert.base64Decode(
    'ChZOb3RpZmllclN0YW5kYXJkUmV0dXJuEhIKBENvZGUYASABKARSBENvZGUSGAoHTWVzc2FnZR'
    'gCIAEoCVIHTWVzc2FnZQ==');

@$core.Deprecated('Use changeStateDescriptor instead')
const ChangeState$json = {
  '1': 'ChangeState',
  '2': [
    {'1': 'Comp', '3': 1, '4': 1, '5': 9, '10': 'Comp'},
    {'1': 'Field', '3': 2, '4': 1, '5': 9, '10': 'Field'},
    {'1': 'Action', '3': 3, '4': 1, '5': 9, '10': 'Action'},
    {'1': 'Value', '3': 4, '4': 1, '5': 9, '10': 'Value'},
  ],
};

/// Descriptor for `ChangeState`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List changeStateDescriptor = $convert.base64Decode(
    'CgtDaGFuZ2VTdGF0ZRISCgRDb21wGAEgASgJUgRDb21wEhQKBUZpZWxkGAIgASgJUgVGaWVsZB'
    'IWCgZBY3Rpb24YAyABKAlSBkFjdGlvbhIUCgVWYWx1ZRgEIAEoCVIFVmFsdWU=');

@$core.Deprecated('Use saveLocalDescriptor instead')
const SaveLocal$json = {
  '1': 'SaveLocal',
  '2': [
    {'1': 'Key', '3': 1, '4': 1, '5': 9, '10': 'Key'},
    {'1': 'Value', '3': 2, '4': 1, '5': 9, '10': 'Value'},
  ],
};

/// Descriptor for `SaveLocal`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List saveLocalDescriptor = $convert.base64Decode(
    'CglTYXZlTG9jYWwSEAoDS2V5GAEgASgJUgNLZXkSFAoFVmFsdWUYAiABKAlSBVZhbHVl');

