/* This file was generated by upbc (the upb compiler) from the input
 * file:
 *
 *     envoy/service/discovery/v2/ads.proto
 *
 * Do not edit -- your changes will be discarded when the file is
 * regenerated. */

#include "upb/def.h"
#include "envoy/service/discovery/v2/ads.upbdefs.h"

extern upb_def_init envoy_api_v2_discovery_proto_upbdefinit;
extern upb_def_init udpa_annotations_status_proto_upbdefinit;
extern const upb_msglayout envoy_service_discovery_v2_AdsDummy_msginit;

static const upb_msglayout *layouts[1] = {
  &envoy_service_discovery_v2_AdsDummy_msginit,
};

static const char descriptor[454] = {'\n', '$', 'e', 'n', 'v', 'o', 'y', '/', 's', 'e', 'r', 'v', 'i', 'c', 'e', '/', 'd', 'i', 's', 'c', 'o', 'v', 'e', 'r', 'y', 
'/', 'v', '2', '/', 'a', 'd', 's', '.', 'p', 'r', 'o', 't', 'o', '\022', '\032', 'e', 'n', 'v', 'o', 'y', '.', 's', 'e', 'r', 'v', 
'i', 'c', 'e', '.', 'd', 'i', 's', 'c', 'o', 'v', 'e', 'r', 'y', '.', 'v', '2', '\032', '\034', 'e', 'n', 'v', 'o', 'y', '/', 'a', 
'p', 'i', '/', 'v', '2', '/', 'd', 'i', 's', 'c', 'o', 'v', 'e', 'r', 'y', '.', 'p', 'r', 'o', 't', 'o', '\032', '\035', 'u', 'd', 
'p', 'a', '/', 'a', 'n', 'n', 'o', 't', 'a', 't', 'i', 'o', 'n', 's', '/', 's', 't', 'a', 't', 'u', 's', '.', 'p', 'r', 'o', 
't', 'o', '\"', '\n', '\n', '\010', 'A', 'd', 's', 'D', 'u', 'm', 'm', 'y', '2', '\355', '\001', '\n', '\032', 'A', 'g', 'g', 'r', 'e', 'g', 
'a', 't', 'e', 'd', 'D', 'i', 's', 'c', 'o', 'v', 'e', 'r', 'y', 'S', 'e', 'r', 'v', 'i', 'c', 'e', '\022', 'b', '\n', '\031', 'S', 
't', 'r', 'e', 'a', 'm', 'A', 'g', 'g', 'r', 'e', 'g', 'a', 't', 'e', 'd', 'R', 'e', 's', 'o', 'u', 'r', 'c', 'e', 's', '\022', 
'\036', '.', 'e', 'n', 'v', 'o', 'y', '.', 'a', 'p', 'i', '.', 'v', '2', '.', 'D', 'i', 's', 'c', 'o', 'v', 'e', 'r', 'y', 'R', 
'e', 'q', 'u', 'e', 's', 't', '\032', '\037', '.', 'e', 'n', 'v', 'o', 'y', '.', 'a', 'p', 'i', '.', 'v', '2', '.', 'D', 'i', 's', 
'c', 'o', 'v', 'e', 'r', 'y', 'R', 'e', 's', 'p', 'o', 'n', 's', 'e', '\"', '\000', '(', '\001', '0', '\001', '\022', 'k', '\n', '\030', 'D', 
'e', 'l', 't', 'a', 'A', 'g', 'g', 'r', 'e', 'g', 'a', 't', 'e', 'd', 'R', 'e', 's', 'o', 'u', 'r', 'c', 'e', 's', '\022', '#', 
'.', 'e', 'n', 'v', 'o', 'y', '.', 'a', 'p', 'i', '.', 'v', '2', '.', 'D', 'e', 'l', 't', 'a', 'D', 'i', 's', 'c', 'o', 'v', 
'e', 'r', 'y', 'R', 'e', 'q', 'u', 'e', 's', 't', '\032', '$', '.', 'e', 'n', 'v', 'o', 'y', '.', 'a', 'p', 'i', '.', 'v', '2', 
'.', 'D', 'e', 'l', 't', 'a', 'D', 'i', 's', 'c', 'o', 'v', 'e', 'r', 'y', 'R', 'e', 's', 'p', 'o', 'n', 's', 'e', '\"', '\000', 
'(', '\001', '0', '\001', 'B', 'A', '\n', '(', 'i', 'o', '.', 'e', 'n', 'v', 'o', 'y', 'p', 'r', 'o', 'x', 'y', '.', 'e', 'n', 'v', 
'o', 'y', '.', 's', 'e', 'r', 'v', 'i', 'c', 'e', '.', 'd', 'i', 's', 'c', 'o', 'v', 'e', 'r', 'y', '.', 'v', '2', 'B', '\010', 
'A', 'd', 's', 'P', 'r', 'o', 't', 'o', 'P', '\001', '\210', '\001', '\001', '\272', '\200', '\310', '\321', '\006', '\002', '\020', '\001', 'b', '\006', 'p', 'r', 
'o', 't', 'o', '3', 
};

static upb_def_init *deps[3] = {
  &envoy_api_v2_discovery_proto_upbdefinit,
  &udpa_annotations_status_proto_upbdefinit,
  NULL
};

upb_def_init envoy_service_discovery_v2_ads_proto_upbdefinit = {
  deps,
  layouts,
  "envoy/service/discovery/v2/ads.proto",
  UPB_STRVIEW_INIT(descriptor, 454)
};
