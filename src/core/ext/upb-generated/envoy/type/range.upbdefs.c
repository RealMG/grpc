/* This file was generated by upbc (the upb compiler) from the input
 * file:
 *
 *     envoy/type/range.proto
 *
 * Do not edit -- your changes will be discarded when the file is
 * regenerated. */

#include "upb/def.h"
#include "envoy/type/range.upbdefs.h"

extern upb_def_init udpa_annotations_status_proto_upbdefinit;
extern const upb_msglayout envoy_type_Int64Range_msginit;
extern const upb_msglayout envoy_type_Int32Range_msginit;
extern const upb_msglayout envoy_type_DoubleRange_msginit;

static const upb_msglayout *layouts[3] = {
  &envoy_type_Int64Range_msginit,
  &envoy_type_Int32Range_msginit,
  &envoy_type_DoubleRange_msginit,
};

static const char descriptor[288] = {'\n', '\026', 'e', 'n', 'v', 'o', 'y', '/', 't', 'y', 'p', 'e', '/', 'r', 'a', 'n', 'g', 'e', '.', 'p', 'r', 'o', 't', 'o', '\022', 
'\n', 'e', 'n', 'v', 'o', 'y', '.', 't', 'y', 'p', 'e', '\032', '\035', 'u', 'd', 'p', 'a', '/', 'a', 'n', 'n', 'o', 't', 'a', 't', 
'i', 'o', 'n', 's', '/', 's', 't', 'a', 't', 'u', 's', '.', 'p', 'r', 'o', 't', 'o', '\"', '4', '\n', '\n', 'I', 'n', 't', '6', 
'4', 'R', 'a', 'n', 'g', 'e', '\022', '\024', '\n', '\005', 's', 't', 'a', 'r', 't', '\030', '\001', ' ', '\001', '(', '\003', 'R', '\005', 's', 't', 
'a', 'r', 't', '\022', '\020', '\n', '\003', 'e', 'n', 'd', '\030', '\002', ' ', '\001', '(', '\003', 'R', '\003', 'e', 'n', 'd', '\"', '4', '\n', '\n', 
'I', 'n', 't', '3', '2', 'R', 'a', 'n', 'g', 'e', '\022', '\024', '\n', '\005', 's', 't', 'a', 'r', 't', '\030', '\001', ' ', '\001', '(', '\005', 
'R', '\005', 's', 't', 'a', 'r', 't', '\022', '\020', '\n', '\003', 'e', 'n', 'd', '\030', '\002', ' ', '\001', '(', '\005', 'R', '\003', 'e', 'n', 'd', 
'\"', '5', '\n', '\013', 'D', 'o', 'u', 'b', 'l', 'e', 'R', 'a', 'n', 'g', 'e', '\022', '\024', '\n', '\005', 's', 't', 'a', 'r', 't', '\030', 
'\001', ' ', '\001', '(', '\001', 'R', '\005', 's', 't', 'a', 'r', 't', '\022', '\020', '\n', '\003', 'e', 'n', 'd', '\030', '\002', ' ', '\001', '(', '\001', 
'R', '\003', 'e', 'n', 'd', 'B', '0', '\n', '\030', 'i', 'o', '.', 'e', 'n', 'v', 'o', 'y', 'p', 'r', 'o', 'x', 'y', '.', 'e', 'n', 
'v', 'o', 'y', '.', 't', 'y', 'p', 'e', 'B', '\n', 'R', 'a', 'n', 'g', 'e', 'P', 'r', 'o', 't', 'o', 'P', '\001', '\272', '\200', '\310', 
'\321', '\006', '\002', '\020', '\001', 'b', '\006', 'p', 'r', 'o', 't', 'o', '3', 
};

static upb_def_init *deps[2] = {
  &udpa_annotations_status_proto_upbdefinit,
  NULL
};

upb_def_init envoy_type_range_proto_upbdefinit = {
  deps,
  layouts,
  "envoy/type/range.proto",
  UPB_STRVIEW_INIT(descriptor, 288)
};
