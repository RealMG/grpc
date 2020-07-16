/* This file was generated by upbc (the upb compiler) from the input
 * file:
 *
 *     envoy/api/v2/listener/listener_components.proto
 *
 * Do not edit -- your changes will be discarded when the file is
 * regenerated. */

#include "upb/def.h"
#include "envoy/api/v2/listener/listener_components.upbdefs.h"

extern upb_def_init envoy_api_v2_auth_tls_proto_upbdefinit;
extern upb_def_init envoy_api_v2_core_address_proto_upbdefinit;
extern upb_def_init envoy_api_v2_core_base_proto_upbdefinit;
extern upb_def_init envoy_type_range_proto_upbdefinit;
extern upb_def_init google_protobuf_any_proto_upbdefinit;
extern upb_def_init google_protobuf_struct_proto_upbdefinit;
extern upb_def_init google_protobuf_wrappers_proto_upbdefinit;
extern upb_def_init udpa_annotations_migrate_proto_upbdefinit;
extern upb_def_init udpa_annotations_status_proto_upbdefinit;
extern upb_def_init validate_validate_proto_upbdefinit;
extern const upb_msglayout envoy_api_v2_listener_Filter_msginit;
extern const upb_msglayout envoy_api_v2_listener_FilterChainMatch_msginit;
extern const upb_msglayout envoy_api_v2_listener_FilterChain_msginit;
extern const upb_msglayout envoy_api_v2_listener_ListenerFilterChainMatchPredicate_msginit;
extern const upb_msglayout envoy_api_v2_listener_ListenerFilterChainMatchPredicate_MatchSet_msginit;
extern const upb_msglayout envoy_api_v2_listener_ListenerFilter_msginit;

static const upb_msglayout *layouts[6] = {
  &envoy_api_v2_listener_Filter_msginit,
  &envoy_api_v2_listener_FilterChainMatch_msginit,
  &envoy_api_v2_listener_FilterChain_msginit,
  &envoy_api_v2_listener_ListenerFilterChainMatchPredicate_msginit,
  &envoy_api_v2_listener_ListenerFilterChainMatchPredicate_MatchSet_msginit,
  &envoy_api_v2_listener_ListenerFilter_msginit,
};

static const char descriptor[2741] = {'\n', '/', 'e', 'n', 'v', 'o', 'y', '/', 'a', 'p', 'i', '/', 'v', '2', '/', 'l', 'i', 's', 't', 'e', 'n', 'e', 'r', '/', 'l', 
'i', 's', 't', 'e', 'n', 'e', 'r', '_', 'c', 'o', 'm', 'p', 'o', 'n', 'e', 'n', 't', 's', '.', 'p', 'r', 'o', 't', 'o', '\022', 
'\025', 'e', 'n', 'v', 'o', 'y', '.', 'a', 'p', 'i', '.', 'v', '2', '.', 'l', 'i', 's', 't', 'e', 'n', 'e', 'r', '\032', '\033', 'e', 
'n', 'v', 'o', 'y', '/', 'a', 'p', 'i', '/', 'v', '2', '/', 'a', 'u', 't', 'h', '/', 't', 'l', 's', '.', 'p', 'r', 'o', 't', 
'o', '\032', '\037', 'e', 'n', 'v', 'o', 'y', '/', 'a', 'p', 'i', '/', 'v', '2', '/', 'c', 'o', 'r', 'e', '/', 'a', 'd', 'd', 'r', 
'e', 's', 's', '.', 'p', 'r', 'o', 't', 'o', '\032', '\034', 'e', 'n', 'v', 'o', 'y', '/', 'a', 'p', 'i', '/', 'v', '2', '/', 'c', 
'o', 'r', 'e', '/', 'b', 'a', 's', 'e', '.', 'p', 'r', 'o', 't', 'o', '\032', '\026', 'e', 'n', 'v', 'o', 'y', '/', 't', 'y', 'p', 
'e', '/', 'r', 'a', 'n', 'g', 'e', '.', 'p', 'r', 'o', 't', 'o', '\032', '\031', 'g', 'o', 'o', 'g', 'l', 'e', '/', 'p', 'r', 'o', 
't', 'o', 'b', 'u', 'f', '/', 'a', 'n', 'y', '.', 'p', 'r', 'o', 't', 'o', '\032', '\034', 'g', 'o', 'o', 'g', 'l', 'e', '/', 'p', 
'r', 'o', 't', 'o', 'b', 'u', 'f', '/', 's', 't', 'r', 'u', 'c', 't', '.', 'p', 'r', 'o', 't', 'o', '\032', '\036', 'g', 'o', 'o', 
'g', 'l', 'e', '/', 'p', 'r', 'o', 't', 'o', 'b', 'u', 'f', '/', 'w', 'r', 'a', 'p', 'p', 'e', 'r', 's', '.', 'p', 'r', 'o', 
't', 'o', '\032', '\036', 'u', 'd', 'p', 'a', '/', 'a', 'n', 'n', 'o', 't', 'a', 't', 'i', 'o', 'n', 's', '/', 'm', 'i', 'g', 'r', 
'a', 't', 'e', '.', 'p', 'r', 'o', 't', 'o', '\032', '\035', 'u', 'd', 'p', 'a', '/', 'a', 'n', 'n', 'o', 't', 'a', 't', 'i', 'o', 
'n', 's', '/', 's', 't', 'a', 't', 'u', 's', '.', 'p', 'r', 'o', 't', 'o', '\032', '\027', 'v', 'a', 'l', 'i', 'd', 'a', 't', 'e', 
'/', 'v', 'a', 'l', 'i', 'd', 'a', 't', 'e', '.', 'p', 'r', 'o', 't', 'o', '\"', '\254', '\001', '\n', '\006', 'F', 'i', 'l', 't', 'e', 
'r', '\022', '\033', '\n', '\004', 'n', 'a', 'm', 'e', '\030', '\001', ' ', '\001', '(', '\t', 'B', '\007', '\372', 'B', '\004', 'r', '\002', ' ', '\001', 'R', 
'\004', 'n', 'a', 'm', 'e', '\022', '5', '\n', '\006', 'c', 'o', 'n', 'f', 'i', 'g', '\030', '\002', ' ', '\001', '(', '\013', '2', '\027', '.', 'g', 
'o', 'o', 'g', 'l', 'e', '.', 'p', 'r', 'o', 't', 'o', 'b', 'u', 'f', '.', 'S', 't', 'r', 'u', 'c', 't', 'B', '\002', '\030', '\001', 
'H', '\000', 'R', '\006', 'c', 'o', 'n', 'f', 'i', 'g', '\022', '9', '\n', '\014', 't', 'y', 'p', 'e', 'd', '_', 'c', 'o', 'n', 'f', 'i', 
'g', '\030', '\004', ' ', '\001', '(', '\013', '2', '\024', '.', 'g', 'o', 'o', 'g', 'l', 'e', '.', 'p', 'r', 'o', 't', 'o', 'b', 'u', 'f', 
'.', 'A', 'n', 'y', 'H', '\000', 'R', '\013', 't', 'y', 'p', 'e', 'd', 'C', 'o', 'n', 'f', 'i', 'g', 'B', '\r', '\n', '\013', 'c', 'o', 
'n', 'f', 'i', 'g', '_', 't', 'y', 'p', 'e', 'J', '\004', '\010', '\003', '\020', '\004', '\"', '\341', '\005', '\n', '\020', 'F', 'i', 'l', 't', 'e', 
'r', 'C', 'h', 'a', 'i', 'n', 'M', 'a', 't', 'c', 'h', '\022', 'T', '\n', '\020', 'd', 'e', 's', 't', 'i', 'n', 'a', 't', 'i', 'o', 
'n', '_', 'p', 'o', 'r', 't', '\030', '\010', ' ', '\001', '(', '\013', '2', '\034', '.', 'g', 'o', 'o', 'g', 'l', 'e', '.', 'p', 'r', 'o', 
't', 'o', 'b', 'u', 'f', '.', 'U', 'I', 'n', 't', '3', '2', 'V', 'a', 'l', 'u', 'e', 'B', '\013', '\372', 'B', '\010', '*', '\006', '\030', 
'\377', '\377', '\003', '(', '\001', 'R', '\017', 'd', 'e', 's', 't', 'i', 'n', 'a', 't', 'i', 'o', 'n', 'P', 'o', 'r', 't', '\022', 'A', '\n', 
'\r', 'p', 'r', 'e', 'f', 'i', 'x', '_', 'r', 'a', 'n', 'g', 'e', 's', '\030', '\003', ' ', '\003', '(', '\013', '2', '\034', '.', 'e', 'n', 
'v', 'o', 'y', '.', 'a', 'p', 'i', '.', 'v', '2', '.', 'c', 'o', 'r', 'e', '.', 'C', 'i', 'd', 'r', 'R', 'a', 'n', 'g', 'e', 
'R', '\014', 'p', 'r', 'e', 'f', 'i', 'x', 'R', 'a', 'n', 'g', 'e', 's', '\022', '%', '\n', '\016', 'a', 'd', 'd', 'r', 'e', 's', 's', 
'_', 's', 'u', 'f', 'f', 'i', 'x', '\030', '\004', ' ', '\001', '(', '\t', 'R', '\r', 'a', 'd', 'd', 'r', 'e', 's', 's', 'S', 'u', 'f', 
'f', 'i', 'x', '\022', ';', '\n', '\n', 's', 'u', 'f', 'f', 'i', 'x', '_', 'l', 'e', 'n', '\030', '\005', ' ', '\001', '(', '\013', '2', '\034', 
'.', 'g', 'o', 'o', 'g', 'l', 'e', '.', 'p', 'r', 'o', 't', 'o', 'b', 'u', 'f', '.', 'U', 'I', 'n', 't', '3', '2', 'V', 'a', 
'l', 'u', 'e', 'R', '\t', 's', 'u', 'f', 'f', 'i', 'x', 'L', 'e', 'n', '\022', 'g', '\n', '\013', 's', 'o', 'u', 'r', 'c', 'e', '_', 
't', 'y', 'p', 'e', '\030', '\014', ' ', '\001', '(', '\016', '2', '<', '.', 'e', 'n', 'v', 'o', 'y', '.', 'a', 'p', 'i', '.', 'v', '2', 
'.', 'l', 'i', 's', 't', 'e', 'n', 'e', 'r', '.', 'F', 'i', 'l', 't', 'e', 'r', 'C', 'h', 'a', 'i', 'n', 'M', 'a', 't', 'c', 
'h', '.', 'C', 'o', 'n', 'n', 'e', 'c', 't', 'i', 'o', 'n', 'S', 'o', 'u', 'r', 'c', 'e', 'T', 'y', 'p', 'e', 'B', '\010', '\372', 
'B', '\005', '\202', '\001', '\002', '\020', '\001', 'R', '\n', 's', 'o', 'u', 'r', 'c', 'e', 'T', 'y', 'p', 'e', '\022', 'N', '\n', '\024', 's', 'o', 
'u', 'r', 'c', 'e', '_', 'p', 'r', 'e', 'f', 'i', 'x', '_', 'r', 'a', 'n', 'g', 'e', 's', '\030', '\006', ' ', '\003', '(', '\013', '2', 
'\034', '.', 'e', 'n', 'v', 'o', 'y', '.', 'a', 'p', 'i', '.', 'v', '2', '.', 'c', 'o', 'r', 'e', '.', 'C', 'i', 'd', 'r', 'R', 
'a', 'n', 'g', 'e', 'R', '\022', 's', 'o', 'u', 'r', 'c', 'e', 'P', 'r', 'e', 'f', 'i', 'x', 'R', 'a', 'n', 'g', 'e', 's', '\022', 
'3', '\n', '\014', 's', 'o', 'u', 'r', 'c', 'e', '_', 'p', 'o', 'r', 't', 's', '\030', '\007', ' ', '\003', '(', '\r', 'B', '\020', '\372', 'B', 
'\r', '\222', '\001', '\n', '\"', '\010', '*', '\006', '\030', '\377', '\377', '\003', '(', '\001', 'R', '\013', 's', 'o', 'u', 'r', 'c', 'e', 'P', 'o', 'r', 
't', 's', '\022', '!', '\n', '\014', 's', 'e', 'r', 'v', 'e', 'r', '_', 'n', 'a', 'm', 'e', 's', '\030', '\013', ' ', '\003', '(', '\t', 'R', 
'\013', 's', 'e', 'r', 'v', 'e', 'r', 'N', 'a', 'm', 'e', 's', '\022', '-', '\n', '\022', 't', 'r', 'a', 'n', 's', 'p', 'o', 'r', 't', 
'_', 'p', 'r', 'o', 't', 'o', 'c', 'o', 'l', '\030', '\t', ' ', '\001', '(', '\t', 'R', '\021', 't', 'r', 'a', 'n', 's', 'p', 'o', 'r', 
't', 'P', 'r', 'o', 't', 'o', 'c', 'o', 'l', '\022', '3', '\n', '\025', 'a', 'p', 'p', 'l', 'i', 'c', 'a', 't', 'i', 'o', 'n', '_', 
'p', 'r', 'o', 't', 'o', 'c', 'o', 'l', 's', '\030', '\n', ' ', '\003', '(', '\t', 'R', '\024', 'a', 'p', 'p', 'l', 'i', 'c', 'a', 't', 
'i', 'o', 'n', 'P', 'r', 'o', 't', 'o', 'c', 'o', 'l', 's', '\"', 'U', '\n', '\024', 'C', 'o', 'n', 'n', 'e', 'c', 't', 'i', 'o', 
'n', 'S', 'o', 'u', 'r', 'c', 'e', 'T', 'y', 'p', 'e', '\022', '\007', '\n', '\003', 'A', 'N', 'Y', '\020', '\000', '\022', '&', '\n', '\005', 'L', 
'O', 'C', 'A', 'L', '\020', '\001', '\032', '\033', '\362', '\230', '\376', '\217', '\005', '\025', '\n', '\023', 'S', 'A', 'M', 'E', '_', 'I', 'P', '_', 'O', 
'R', '_', 'L', 'O', 'O', 'P', 'B', 'A', 'C', 'K', '\022', '\014', '\n', '\010', 'E', 'X', 'T', 'E', 'R', 'N', 'A', 'L', '\020', '\002', 'J', 
'\004', '\010', '\001', '\020', '\002', '\"', '\313', '\003', '\n', '\013', 'F', 'i', 'l', 't', 'e', 'r', 'C', 'h', 'a', 'i', 'n', '\022', 'U', '\n', '\022', 
'f', 'i', 'l', 't', 'e', 'r', '_', 'c', 'h', 'a', 'i', 'n', '_', 'm', 'a', 't', 'c', 'h', '\030', '\001', ' ', '\001', '(', '\013', '2', 
'\'', '.', 'e', 'n', 'v', 'o', 'y', '.', 'a', 'p', 'i', '.', 'v', '2', '.', 'l', 'i', 's', 't', 'e', 'n', 'e', 'r', '.', 'F', 
'i', 'l', 't', 'e', 'r', 'C', 'h', 'a', 'i', 'n', 'M', 'a', 't', 'c', 'h', 'R', '\020', 'f', 'i', 'l', 't', 'e', 'r', 'C', 'h', 
'a', 'i', 'n', 'M', 'a', 't', 'c', 'h', '\022', 'L', '\n', '\013', 't', 'l', 's', '_', 'c', 'o', 'n', 't', 'e', 'x', 't', '\030', '\002', 
' ', '\001', '(', '\013', '2', '\'', '.', 'e', 'n', 'v', 'o', 'y', '.', 'a', 'p', 'i', '.', 'v', '2', '.', 'a', 'u', 't', 'h', '.', 
'D', 'o', 'w', 'n', 's', 't', 'r', 'e', 'a', 'm', 'T', 'l', 's', 'C', 'o', 'n', 't', 'e', 'x', 't', 'B', '\002', '\030', '\001', 'R', 
'\n', 't', 'l', 's', 'C', 'o', 'n', 't', 'e', 'x', 't', '\022', '7', '\n', '\007', 'f', 'i', 'l', 't', 'e', 'r', 's', '\030', '\003', ' ', 
'\003', '(', '\013', '2', '\035', '.', 'e', 'n', 'v', 'o', 'y', '.', 'a', 'p', 'i', '.', 'v', '2', '.', 'l', 'i', 's', 't', 'e', 'n', 
'e', 'r', '.', 'F', 'i', 'l', 't', 'e', 'r', 'R', '\007', 'f', 'i', 'l', 't', 'e', 'r', 's', '\022', 'B', '\n', '\017', 'u', 's', 'e', 
'_', 'p', 'r', 'o', 'x', 'y', '_', 'p', 'r', 'o', 't', 'o', '\030', '\004', ' ', '\001', '(', '\013', '2', '\032', '.', 'g', 'o', 'o', 'g', 
'l', 'e', '.', 'p', 'r', 'o', 't', 'o', 'b', 'u', 'f', '.', 'B', 'o', 'o', 'l', 'V', 'a', 'l', 'u', 'e', 'R', '\r', 'u', 's', 
'e', 'P', 'r', 'o', 'x', 'y', 'P', 'r', 'o', 't', 'o', '\022', '7', '\n', '\010', 'm', 'e', 't', 'a', 'd', 'a', 't', 'a', '\030', '\005', 
' ', '\001', '(', '\013', '2', '\033', '.', 'e', 'n', 'v', 'o', 'y', '.', 'a', 'p', 'i', '.', 'v', '2', '.', 'c', 'o', 'r', 'e', '.', 
'M', 'e', 't', 'a', 'd', 'a', 't', 'a', 'R', '\010', 'm', 'e', 't', 'a', 'd', 'a', 't', 'a', '\022', 'M', '\n', '\020', 't', 'r', 'a', 
'n', 's', 'p', 'o', 'r', 't', '_', 's', 'o', 'c', 'k', 'e', 't', '\030', '\006', ' ', '\001', '(', '\013', '2', '\"', '.', 'e', 'n', 'v', 
'o', 'y', '.', 'a', 'p', 'i', '.', 'v', '2', '.', 'c', 'o', 'r', 'e', '.', 'T', 'r', 'a', 'n', 's', 'p', 'o', 'r', 't', 'S', 
'o', 'c', 'k', 'e', 't', 'R', '\017', 't', 'r', 'a', 'n', 's', 'p', 'o', 'r', 't', 'S', 'o', 'c', 'k', 'e', 't', '\022', '\022', '\n', 
'\004', 'n', 'a', 'm', 'e', '\030', '\007', ' ', '\001', '(', '\t', 'R', '\004', 'n', 'a', 'm', 'e', '\"', '\251', '\004', '\n', '!', 'L', 'i', 's', 
't', 'e', 'n', 'e', 'r', 'F', 'i', 'l', 't', 'e', 'r', 'C', 'h', 'a', 'i', 'n', 'M', 'a', 't', 'c', 'h', 'P', 'r', 'e', 'd', 
'i', 'c', 'a', 't', 'e', '\022', '^', '\n', '\010', 'o', 'r', '_', 'm', 'a', 't', 'c', 'h', '\030', '\001', ' ', '\001', '(', '\013', '2', 'A', 
'.', 'e', 'n', 'v', 'o', 'y', '.', 'a', 'p', 'i', '.', 'v', '2', '.', 'l', 'i', 's', 't', 'e', 'n', 'e', 'r', '.', 'L', 'i', 
's', 't', 'e', 'n', 'e', 'r', 'F', 'i', 'l', 't', 'e', 'r', 'C', 'h', 'a', 'i', 'n', 'M', 'a', 't', 'c', 'h', 'P', 'r', 'e', 
'd', 'i', 'c', 'a', 't', 'e', '.', 'M', 'a', 't', 'c', 'h', 'S', 'e', 't', 'H', '\000', 'R', '\007', 'o', 'r', 'M', 'a', 't', 'c', 
'h', '\022', '`', '\n', '\t', 'a', 'n', 'd', '_', 'm', 'a', 't', 'c', 'h', '\030', '\002', ' ', '\001', '(', '\013', '2', 'A', '.', 'e', 'n', 
'v', 'o', 'y', '.', 'a', 'p', 'i', '.', 'v', '2', '.', 'l', 'i', 's', 't', 'e', 'n', 'e', 'r', '.', 'L', 'i', 's', 't', 'e', 
'n', 'e', 'r', 'F', 'i', 'l', 't', 'e', 'r', 'C', 'h', 'a', 'i', 'n', 'M', 'a', 't', 'c', 'h', 'P', 'r', 'e', 'd', 'i', 'c', 
'a', 't', 'e', '.', 'M', 'a', 't', 'c', 'h', 'S', 'e', 't', 'H', '\000', 'R', '\010', 'a', 'n', 'd', 'M', 'a', 't', 'c', 'h', '\022', 
'W', '\n', '\t', 'n', 'o', 't', '_', 'm', 'a', 't', 'c', 'h', '\030', '\003', ' ', '\001', '(', '\013', '2', '8', '.', 'e', 'n', 'v', 'o', 
'y', '.', 'a', 'p', 'i', '.', 'v', '2', '.', 'l', 'i', 's', 't', 'e', 'n', 'e', 'r', '.', 'L', 'i', 's', 't', 'e', 'n', 'e', 
'r', 'F', 'i', 'l', 't', 'e', 'r', 'C', 'h', 'a', 'i', 'n', 'M', 'a', 't', 'c', 'h', 'P', 'r', 'e', 'd', 'i', 'c', 'a', 't', 
'e', 'H', '\000', 'R', '\010', 'n', 'o', 't', 'M', 'a', 't', 'c', 'h', '\022', '&', '\n', '\t', 'a', 'n', 'y', '_', 'm', 'a', 't', 'c', 
'h', '\030', '\004', ' ', '\001', '(', '\010', 'B', '\007', '\372', 'B', '\004', 'j', '\002', '\010', '\001', 'H', '\000', 'R', '\010', 'a', 'n', 'y', 'M', 'a', 
't', 'c', 'h', '\022', 'N', '\n', '\026', 'd', 'e', 's', 't', 'i', 'n', 'a', 't', 'i', 'o', 'n', '_', 'p', 'o', 'r', 't', '_', 'r', 
'a', 'n', 'g', 'e', '\030', '\005', ' ', '\001', '(', '\013', '2', '\026', '.', 'e', 'n', 'v', 'o', 'y', '.', 't', 'y', 'p', 'e', '.', 'I', 
'n', 't', '3', '2', 'R', 'a', 'n', 'g', 'e', 'H', '\000', 'R', '\024', 'd', 'e', 's', 't', 'i', 'n', 'a', 't', 'i', 'o', 'n', 'P', 
'o', 'r', 't', 'R', 'a', 'n', 'g', 'e', '\032', 'd', '\n', '\010', 'M', 'a', 't', 'c', 'h', 'S', 'e', 't', '\022', 'X', '\n', '\005', 'r', 
'u', 'l', 'e', 's', '\030', '\001', ' ', '\003', '(', '\013', '2', '8', '.', 'e', 'n', 'v', 'o', 'y', '.', 'a', 'p', 'i', '.', 'v', '2', 
'.', 'l', 'i', 's', 't', 'e', 'n', 'e', 'r', '.', 'L', 'i', 's', 't', 'e', 'n', 'e', 'r', 'F', 'i', 'l', 't', 'e', 'r', 'C', 
'h', 'a', 'i', 'n', 'M', 'a', 't', 'c', 'h', 'P', 'r', 'e', 'd', 'i', 'c', 'a', 't', 'e', 'B', '\010', '\372', 'B', '\005', '\222', '\001', 
'\002', '\010', '\002', 'R', '\005', 'r', 'u', 'l', 'e', 's', 'B', '\013', '\n', '\004', 'r', 'u', 'l', 'e', '\022', '\003', '\370', 'B', '\001', '\"', '\221', 
'\002', '\n', '\016', 'L', 'i', 's', 't', 'e', 'n', 'e', 'r', 'F', 'i', 'l', 't', 'e', 'r', '\022', '\033', '\n', '\004', 'n', 'a', 'm', 'e', 
'\030', '\001', ' ', '\001', '(', '\t', 'B', '\007', '\372', 'B', '\004', 'r', '\002', ' ', '\001', 'R', '\004', 'n', 'a', 'm', 'e', '\022', '5', '\n', '\006', 
'c', 'o', 'n', 'f', 'i', 'g', '\030', '\002', ' ', '\001', '(', '\013', '2', '\027', '.', 'g', 'o', 'o', 'g', 'l', 'e', '.', 'p', 'r', 'o', 
't', 'o', 'b', 'u', 'f', '.', 'S', 't', 'r', 'u', 'c', 't', 'B', '\002', '\030', '\001', 'H', '\000', 'R', '\006', 'c', 'o', 'n', 'f', 'i', 
'g', '\022', '9', '\n', '\014', 't', 'y', 'p', 'e', 'd', '_', 'c', 'o', 'n', 'f', 'i', 'g', '\030', '\003', ' ', '\001', '(', '\013', '2', '\024', 
'.', 'g', 'o', 'o', 'g', 'l', 'e', '.', 'p', 'r', 'o', 't', 'o', 'b', 'u', 'f', '.', 'A', 'n', 'y', 'H', '\000', 'R', '\013', 't', 
'y', 'p', 'e', 'd', 'C', 'o', 'n', 'f', 'i', 'g', '\022', 'a', '\n', '\017', 'f', 'i', 'l', 't', 'e', 'r', '_', 'd', 'i', 's', 'a', 
'b', 'l', 'e', 'd', '\030', '\004', ' ', '\001', '(', '\013', '2', '8', '.', 'e', 'n', 'v', 'o', 'y', '.', 'a', 'p', 'i', '.', 'v', '2', 
'.', 'l', 'i', 's', 't', 'e', 'n', 'e', 'r', '.', 'L', 'i', 's', 't', 'e', 'n', 'e', 'r', 'F', 'i', 'l', 't', 'e', 'r', 'C', 
'h', 'a', 'i', 'n', 'M', 'a', 't', 'c', 'h', 'P', 'r', 'e', 'd', 'i', 'c', 'a', 't', 'e', 'R', '\016', 'f', 'i', 'l', 't', 'e', 
'r', 'D', 'i', 's', 'a', 'b', 'l', 'e', 'd', 'B', '\r', '\n', '\013', 'c', 'o', 'n', 'f', 'i', 'g', '_', 't', 'y', 'p', 'e', 'B', 
'\234', '\001', '\n', '#', 'i', 'o', '.', 'e', 'n', 'v', 'o', 'y', 'p', 'r', 'o', 'x', 'y', '.', 'e', 'n', 'v', 'o', 'y', '.', 'a', 
'p', 'i', '.', 'v', '2', '.', 'l', 'i', 's', 't', 'e', 'n', 'e', 'r', 'B', '\027', 'L', 'i', 's', 't', 'e', 'n', 'e', 'r', 'C', 
'o', 'm', 'p', 'o', 'n', 'e', 'n', 't', 's', 'P', 'r', 'o', 't', 'o', 'P', '\001', '\252', '\002', '\027', 'E', 'n', 'v', 'o', 'y', '.', 
'A', 'p', 'i', '.', 'V', '2', '.', 'L', 'i', 's', 't', 'e', 'n', 'e', 'r', 'N', 'S', '\352', '\002', '\027', 'E', 'n', 'v', 'o', 'y', 
'.', 'A', 'p', 'i', '.', 'V', '2', '.', 'L', 'i', 's', 't', 'e', 'n', 'e', 'r', 'N', 'S', '\362', '\230', '\376', '\217', '\005', '\032', '\022', 
'\030', 'e', 'n', 'v', 'o', 'y', '.', 'c', 'o', 'n', 'f', 'i', 'g', '.', 'l', 'i', 's', 't', 'e', 'n', 'e', 'r', '.', 'v', '3', 
'\272', '\200', '\310', '\321', '\006', '\002', '\020', '\001', 'b', '\006', 'p', 'r', 'o', 't', 'o', '3', 
};

static upb_def_init *deps[11] = {
  &envoy_api_v2_auth_tls_proto_upbdefinit,
  &envoy_api_v2_core_address_proto_upbdefinit,
  &envoy_api_v2_core_base_proto_upbdefinit,
  &envoy_type_range_proto_upbdefinit,
  &google_protobuf_any_proto_upbdefinit,
  &google_protobuf_struct_proto_upbdefinit,
  &google_protobuf_wrappers_proto_upbdefinit,
  &udpa_annotations_migrate_proto_upbdefinit,
  &udpa_annotations_status_proto_upbdefinit,
  &validate_validate_proto_upbdefinit,
  NULL
};

upb_def_init envoy_api_v2_listener_listener_components_proto_upbdefinit = {
  deps,
  layouts,
  "envoy/api/v2/listener/listener_components.proto",
  UPB_STRVIEW_INIT(descriptor, 2741)
};
