

# This file has been automatically generated from a template file.
# Please make modifications to
# `templates/src/objective-c/BoringSSL-GRPC.podspec.template` instead. This
# file can be regenerated from the template by running
# `tools/buildgen/generate_projects.sh`. Because of some limitations of this
# template, you might actually need to run the same script twice in a row.
# (see err_data.c section)

# BoringSSL CocoaPods podspec

# Copyright 2015, Google Inc.
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are
# met:
#
#     * Redistributions of source code must retain the above copyright
# notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above
# copyright notice, this list of conditions and the following disclaimer
# in the documentation and/or other materials provided with the
# distribution.
#     * Neither the name of Google Inc. nor the names of its
# contributors may be used to endorse or promote products derived from
# this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
# A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
# OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
# SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
# LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
# DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
# THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

Pod::Spec.new do |s|
  s.name     = 'BoringSSL-GRPC'
  version = '0.0.5'
  s.version  = version
  s.summary  = 'BoringSSL is a fork of OpenSSL that is designed to meet Google\'s needs.'
  # Adapted from the homepage:
  s.description = <<-DESC
    BoringSSL is a fork of OpenSSL that is designed to meet Google's needs.

    Although BoringSSL is an open source project, it is not intended for general use, as OpenSSL is.
    We don't recommend that third parties depend upon it. Doing so is likely to be frustrating
    because there are no guarantees of API stability. Only the latest version of this pod is
    supported, and every new version is a new major version.

    We update Google libraries and programs that use BoringSSL as needed when deciding to make API
    changes. This allows us to mostly avoid compromises in the name of compatibility. It works for
    us, but it may not work for you.

    As a Cocoapods pod, it has the advantage over OpenSSL's pods that the library doesn't need to
    be precompiled. This eliminates the 10 - 20 minutes of wait the first time a user does "pod
    install", lets it be used as a dynamic framework (pending solution of Cocoapods' issue #4605),
    and works with bitcode automatically. It's also thought to be smaller than OpenSSL (which takes
    1MB - 2MB per ARM architecture), but we don't have specific numbers yet.

    BoringSSL arose because Google used OpenSSL for many years in various ways and, over time, built
    up a large number of patches that were maintained while tracking upstream OpenSSL. As Google's
    product portfolio became more complex, more copies of OpenSSL sprung up and the effort involved
    in maintaining all these patches in multiple places was growing steadily.

    Currently BoringSSL is the SSL library in Chrome/Chromium, Android (but it's not part of the
    NDK) and a number of other apps/programs.
  DESC
  s.homepage = 'https://github.com/google/boringssl'
  s.license  = { :type => 'Mixed', :file => 'LICENSE' }
  # "The name and email addresses of the library maintainers, not the Podspec maintainer."
  s.authors  = 'Adam Langley', 'David Benjamin', 'Matt Braithwaite'

  s.source = {
    :git => 'https://github.com/google/boringssl.git',
    :commit => "7f02881e96e51f1873afcf384d02f782b48967ca",
  }

  s.ios.deployment_target = '7.0'
  s.osx.deployment_target = '10.7'
  s.tvos.deployment_target = '10.0'
  s.watchos.deployment_target = '4.0'

  name = 'openssl_grpc'

  # When creating a dynamic framework, name it openssl.framework instead of BoringSSL.framework.
  # This lets users write their includes like `#include <openssl/ssl.h>` as opposed to `#include
  # <BoringSSL/ssl.h>`.
  s.module_name = name

  # When creating a dynamic framework, copy the headers under `include/openssl/` into the root of
  # the `Headers/` directory of the framework (i.e., not under `Headers/include/openssl`).
  #
  # TODO(jcanizales): Debug why this doesn't work on macOS.
  s.header_mappings_dir = 'include/openssl'

  # The above has an undesired effect when creating a static library: It forces users to write
  # includes like `#include <BoringSSL/ssl.h>`. `s.header_dir` adds a path prefix to that, and
  # because Cocoapods lets omit the pod name when including headers of static libraries, the
  # following lets users write `#include <openssl/ssl.h>`.
  s.header_dir = name

  # The module map and umbrella header created automatically by Cocoapods don't work for C libraries
  # like this one. The following file, and a correct umbrella header, are created on the fly by the
  # `prepare_command` of this pod.
  s.module_map = 'include/openssl/BoringSSL.modulemap'

  # We don't need to inhibit all warnings; only -Wno-shorten-64-to-32. But Cocoapods' linter doesn't
  # want that for some reason.
  s.compiler_flags = '-DOPENSSL_NO_ASM', '-GCC_WARN_INHIBIT_ALL_WARNINGS', '-w', '-DBORINGSSL_PREFIX=GRPC'
  s.requires_arc = false

  # Like many other C libraries, BoringSSL has its public headers under `include/<libname>/` and its
  # sources and private headers in other directories outside `include/`. Cocoapods' linter doesn't
  # allow any header to be listed outside the `header_mappings_dir` (even though doing so works in
  # practice). Because we need our `header_mappings_dir` to be `include/openssl/` for the reason
  # mentioned above, we work around the linter limitation by dividing the pod into two subspecs, one
  # for public headers and the other for implementation. Each gets its own `header_mappings_dir`,
  # making the linter happy.
  s.subspec 'Interface' do |ss|
    ss.header_mappings_dir = 'include/openssl'
    ss.source_files = 'include/openssl/*.h'
  end
  s.subspec 'Implementation' do |ss|
    ss.header_mappings_dir = '.'
    ss.source_files = 'ssl/*.{h,c,cc}',
                      'ssl/**/*.{h,c,cc}',
                      'crypto/*.{h,c,cc}',
                      'crypto/**/*.{h,c,cc}',
                      # We have to include fiat because spake25519 depends on it
                      'third_party/fiat/*.{h,c,cc}',
                      # Include the err_data.c generated in prepare_command below
                      'err_data.c'

    ss.private_header_files = 'ssl/*.h',
                              'ssl/**/*.h',
                              'crypto/*.h',
                              'crypto/**/*.h',
                              'third_party/fiat/*.h'
    # bcm.c includes other source files, creating duplicated symbols. Since it is not used, we
    # explicitly exclude it from the pod.
    # TODO (mxyan): Work with BoringSSL team to remove this hack.
    ss.exclude_files = 'crypto/fipsmodule/bcm.c',
                       '**/*_test.*',
                       '**/test_*.*',
                       '**/test/*.*'

    ss.dependency "#{s.name}/Interface", version
  end

  s.prepare_command = <<-END_OF_COMMAND
    # Add a module map and an umbrella header
    cat > include/openssl/umbrella.h <<EOF
      #include "ssl.h"
      #include "crypto.h"
      #include "aes.h"
      /* The following macros are defined by base.h. The latter is the first file included by the    
         other headers. */    
      #if defined(OPENSSL_ARM) || defined(OPENSSL_AARCH64)    
      #  include "arm_arch.h"   
      #endif
      #include "asn1.h"
      #include "asn1_mac.h"
      #include "asn1t.h"
      #include "blowfish.h"
      #include "cast.h"
      #include "chacha.h"
      #include "cmac.h"
      #include "conf.h"
      #include "cpu.h"
      #include "curve25519.h"
      #include "des.h"
      #include "dtls1.h"
      #include "hkdf.h"
      #include "md4.h"
      #include "md5.h"
      #include "obj_mac.h"
      #include "objects.h"
      #include "opensslv.h"
      #include "ossl_typ.h"
      #include "pkcs12.h"
      #include "pkcs7.h"
      #include "pkcs8.h"
      #include "poly1305.h"
      #include "rand.h"
      #include "rc4.h"
      #include "ripemd.h"
      #include "safestack.h"
      #include "srtp.h"
      #include "x509.h"
      #include "x509v3.h"
    EOF
    cat > include/openssl/BoringSSL.modulemap <<EOF
      framework module openssl {
        umbrella header "umbrella.h"
        textual header "arm_arch.h"
        export *
        module * { export * }
      }
    EOF

    # To build boringssl, we need the generated file err_data.c, which is normally generated
    # by boringssl's err_data_generate.go, but we already have a copy of err_data.c checked into the
    # grpc/grpc repository that gets regenerated whenever we update the third_party/boringssl submodule.
    # To make the podspec independent of the grpc repository, the .podspec.template just copies
    # the contents of err_data.c directly into the .podspec.
    # TODO(jtattermusch): avoid needing to run tools/buildgen/generate_projects.sh twice on update
    # TODO(jtattermusch): another pre-generated copy of err_data.c is under third_party/boringssl-with-bazel
    # investigate if we could use it.
    cat > err_data.c <<EOF
      /* Copyright (c) 2015, Google Inc.
       *
       * Permission to use, copy, modify, and/or distribute this software for any
       * purpose with or without fee is hereby granted, provided that the above
       * copyright notice and this permission notice appear in all copies.
       *
       * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
       * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
       * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY
       * SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
       * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION
       * OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN
       * CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE. */
      
       /* This file was generated by err_data_generate.go. */
      
      #include <openssl/base.h>
      #include <openssl/err.h>
      #include <openssl/type_check.h>
      
      
      OPENSSL_STATIC_ASSERT(ERR_LIB_NONE == 1, "library value changed");
      OPENSSL_STATIC_ASSERT(ERR_LIB_SYS == 2, "library value changed");
      OPENSSL_STATIC_ASSERT(ERR_LIB_BN == 3, "library value changed");
      OPENSSL_STATIC_ASSERT(ERR_LIB_RSA == 4, "library value changed");
      OPENSSL_STATIC_ASSERT(ERR_LIB_DH == 5, "library value changed");
      OPENSSL_STATIC_ASSERT(ERR_LIB_EVP == 6, "library value changed");
      OPENSSL_STATIC_ASSERT(ERR_LIB_BUF == 7, "library value changed");
      OPENSSL_STATIC_ASSERT(ERR_LIB_OBJ == 8, "library value changed");
      OPENSSL_STATIC_ASSERT(ERR_LIB_PEM == 9, "library value changed");
      OPENSSL_STATIC_ASSERT(ERR_LIB_DSA == 10, "library value changed");
      OPENSSL_STATIC_ASSERT(ERR_LIB_X509 == 11, "library value changed");
      OPENSSL_STATIC_ASSERT(ERR_LIB_ASN1 == 12, "library value changed");
      OPENSSL_STATIC_ASSERT(ERR_LIB_CONF == 13, "library value changed");
      OPENSSL_STATIC_ASSERT(ERR_LIB_CRYPTO == 14, "library value changed");
      OPENSSL_STATIC_ASSERT(ERR_LIB_EC == 15, "library value changed");
      OPENSSL_STATIC_ASSERT(ERR_LIB_SSL == 16, "library value changed");
      OPENSSL_STATIC_ASSERT(ERR_LIB_BIO == 17, "library value changed");
      OPENSSL_STATIC_ASSERT(ERR_LIB_PKCS7 == 18, "library value changed");
      OPENSSL_STATIC_ASSERT(ERR_LIB_PKCS8 == 19, "library value changed");
      OPENSSL_STATIC_ASSERT(ERR_LIB_X509V3 == 20, "library value changed");
      OPENSSL_STATIC_ASSERT(ERR_LIB_RAND == 21, "library value changed");
      OPENSSL_STATIC_ASSERT(ERR_LIB_ENGINE == 22, "library value changed");
      OPENSSL_STATIC_ASSERT(ERR_LIB_OCSP == 23, "library value changed");
      OPENSSL_STATIC_ASSERT(ERR_LIB_UI == 24, "library value changed");
      OPENSSL_STATIC_ASSERT(ERR_LIB_COMP == 25, "library value changed");
      OPENSSL_STATIC_ASSERT(ERR_LIB_ECDSA == 26, "library value changed");
      OPENSSL_STATIC_ASSERT(ERR_LIB_ECDH == 27, "library value changed");
      OPENSSL_STATIC_ASSERT(ERR_LIB_HMAC == 28, "library value changed");
      OPENSSL_STATIC_ASSERT(ERR_LIB_DIGEST == 29, "library value changed");
      OPENSSL_STATIC_ASSERT(ERR_LIB_CIPHER == 30, "library value changed");
      OPENSSL_STATIC_ASSERT(ERR_LIB_HKDF == 31, "library value changed");
      OPENSSL_STATIC_ASSERT(ERR_LIB_USER == 32, "library value changed");
      OPENSSL_STATIC_ASSERT(ERR_NUM_LIBS == 33, "number of libraries changed");
      
      const uint32_t kOpenSSLReasonValues[] = {
          0xc32083a,
          0xc328854,
          0xc330863,
          0xc338873,
          0xc340882,
          0xc34889b,
          0xc3508a7,
          0xc3588c4,
          0xc3608e4,
          0xc3688f2,
          0xc370902,
          0xc37890f,
          0xc38091f,
          0xc38892a,
          0xc390940,
          0xc39894f,
          0xc3a0963,
          0xc3a8847,
          0xc3b00ea,
          0xc3b88d6,
          0x10320847,
          0x1032959f,
          0x103315ab,
          0x103395c4,
          0x103415d7,
          0x10348f27,
          0x10350c60,
          0x103595ea,
          0x10361614,
          0x10369627,
          0x10371646,
          0x1037965f,
          0x10381674,
          0x10389692,
          0x103916a1,
          0x103996bd,
          0x103a16d8,
          0x103a96e7,
          0x103b1703,
          0x103b971e,
          0x103c1744,
          0x103c80ea,
          0x103d1755,
          0x103d9769,
          0x103e1788,
          0x103e9797,
          0x103f17ae,
          0x103f97c1,
          0x10400c24,
          0x104097d4,
          0x104117f2,
          0x10419805,
          0x1042181f,
          0x1042982f,
          0x10431843,
          0x10439859,
          0x10441871,
          0x10449886,
          0x1045189a,
          0x104598ac,
          0x104605fd,
          0x1046894f,
          0x104718c1,
          0x104798d8,
          0x104818ed,
          0x104898fb,
          0x10490e73,
          0x10499735,
          0x104a15ff,
          0x14320c07,
          0x14328c15,
          0x14330c24,
          0x14338c36,
          0x143400ac,
          0x143480ea,
          0x18320083,
          0x18328f7d,
          0x183300ac,
          0x18338f93,
          0x18340fa7,
          0x183480ea,
          0x18350fbc,
          0x18358fd4,
          0x18360fe9,
          0x18368ffd,
          0x18371021,
          0x18379037,
          0x1838104b,
          0x1838905b,
          0x18390a75,
          0x1839906b,
          0x183a1091,
          0x183a90b7,
          0x183b0c7f,
          0x183b9106,
          0x183c1118,
          0x183c9123,
          0x183d1133,
          0x183d9144,
          0x183e1155,
          0x183e9167,
          0x183f1190,
          0x183f91a9,
          0x184011c1,
          0x184086d5,
          0x184110da,
          0x184190a5,
          0x184210c4,
          0x18428c6c,
          0x18431080,
          0x184390ec,
          0x203211fb,
          0x203291e8,
          0x24321207,
          0x24328995,
          0x24331219,
          0x24339226,
          0x24341233,
          0x24349245,
          0x24351254,
          0x24359271,
          0x2436127e,
          0x2436928c,
          0x2437129a,
          0x243792a8,
          0x243812b1,
          0x243892be,
          0x243912d1,
          0x28320c54,
          0x28328c7f,
          0x28330c24,
          0x28338c92,
          0x28340c60,
          0x283480ac,
          0x283500ea,
          0x28358c6c,
          0x2c322f0c,
          0x2c3292e8,
          0x2c332f1a,
          0x2c33af2c,
          0x2c342f40,
          0x2c34af52,
          0x2c352f6d,
          0x2c35af7f,
          0x2c362f92,
          0x2c36832d,
          0x2c372f9f,
          0x2c37afb1,
          0x2c382fd6,
          0x2c38afed,
          0x2c392ffb,
          0x2c39b00b,
          0x2c3a301d,
          0x2c3ab031,
          0x2c3b3042,
          0x2c3bb061,
          0x2c3c12fa,
          0x2c3c9310,
          0x2c3d3075,
          0x2c3d9329,
          0x2c3e3092,
          0x2c3eb0a0,
          0x2c3f30b8,
          0x2c3fb0d0,
          0x2c4030fa,
          0x2c4091fb,
          0x2c41310b,
          0x2c41b11e,
          0x2c4211c1,
          0x2c42b12f,
          0x2c430722,
          0x2c43b053,
          0x2c442fc4,
          0x2c44b0dd,
          0x30320000,
          0x30328015,
          0x3033001f,
          0x30338038,
          0x3034004a,
          0x30348064,
          0x3035006b,
          0x30358083,
          0x30360094,
          0x303680ac,
          0x303700b9,
          0x303780c8,
          0x303800ea,
          0x303880f7,
          0x3039010a,
          0x30398125,
          0x303a013a,
          0x303a814e,
          0x303b0162,
          0x303b8173,
          0x303c018c,
          0x303c81a9,
          0x303d01b7,
          0x303d81cb,
          0x303e01db,
          0x303e81f4,
          0x303f0204,
          0x303f8217,
          0x30400226,
          0x30408232,
          0x30410247,
          0x30418257,
          0x3042026e,
          0x3042827b,
          0x3043028e,
          0x3043829d,
          0x304402b2,
          0x304482d3,
          0x304502e6,
          0x304582f9,
          0x30460312,
          0x3046832d,
          0x3047034a,
          0x3047835c,
          0x3048036a,
          0x3048837b,
          0x3049038a,
          0x304983a2,
          0x304a03b4,
          0x304a83c8,
          0x304b03e0,
          0x304b83f3,
          0x304c03fe,
          0x304c840f,
          0x304d041b,
          0x304d8431,
          0x304e043f,
          0x304e8455,
          0x304f0467,
          0x304f8479,
          0x3050049c,
          0x305084af,
          0x305104c0,
          0x305184d0,
          0x305204e8,
          0x305284fd,
          0x30530515,
          0x30538529,
          0x30540541,
          0x3054855a,
          0x30550573,
          0x30558590,
          0x3056059b,
          0x305685b3,
          0x305705c3,
          0x305785d4,
          0x305805e7,
          0x305885fd,
          0x30590606,
          0x3059861b,
          0x305a062e,
          0x305a863d,
          0x305b065d,
          0x305b866c,
          0x305c068d,
          0x305c86a9,
          0x305d06b5,
          0x305d86d5,
          0x305e06f1,
          0x305e8702,
          0x305f0718,
          0x305f8722,
          0x3060048c,
          0x34320b65,
          0x34328b79,
          0x34330b96,
          0x34338ba9,
          0x34340bb8,
          0x34348bf1,
          0x34350bd5,
          0x3c320083,
          0x3c328cbc,
          0x3c330cd5,
          0x3c338cf0,
          0x3c340d0d,
          0x3c348d37,
          0x3c350d52,
          0x3c358d78,
          0x3c360d91,
          0x3c368da9,
          0x3c370dba,
          0x3c378dc8,
          0x3c380dd5,
          0x3c388de9,
          0x3c390c7f,
          0x3c398e0c,
          0x3c3a0e20,
          0x3c3a890f,
          0x3c3b0e30,
          0x3c3b8e4b,
          0x3c3c0e5d,
          0x3c3c8e90,
          0x3c3d0e9a,
          0x3c3d8eae,
          0x3c3e0ebc,
          0x3c3e8ee1,
          0x3c3f0ca8,
          0x3c3f8eca,
          0x3c4000ac,
          0x3c4080ea,
          0x3c410d28,
          0x3c418d67,
          0x3c420e73,
          0x3c428dfd,
          0x40321971,
          0x40329987,
          0x403319b5,
          0x403399bf,
          0x403419d6,
          0x403499f4,
          0x40351a04,
          0x40359a16,
          0x40361a23,
          0x40369a2f,
          0x40371a44,
          0x40379a56,
          0x40381a61,
          0x40389a73,
          0x40390f27,
          0x40399a83,
          0x403a1a96,
          0x403a9ab7,
          0x403b1ac8,
          0x403b9ad8,
          0x403c0064,
          0x403c8083,
          0x403d1b5c,
          0x403d9b72,
          0x403e1b81,
          0x403e9bb9,
          0x403f1bd3,
          0x403f9bfb,
          0x40401c10,
          0x40409c24,
          0x40411c41,
          0x40419c5c,
          0x40421c75,
          0x40429c88,
          0x40431c9c,
          0x40439cb4,
          0x40441ccb,
          0x404480ac,
          0x40451ce0,
          0x40459cf2,
          0x40461d16,
          0x40469d36,
          0x40471d44,
          0x40479d6b,
          0x40481ddc,
          0x40489e0f,
          0x40491e26,
          0x40499e40,
          0x404a1e57,
          0x404a9e75,
          0x404b1e8d,
          0x404b9ea4,
          0x404c1eba,
          0x404c9ecc,
          0x404d1eed,
          0x404d9f26,
          0x404e1f3a,
          0x404e9f47,
          0x404f1f8e,
          0x404f9fd4,
          0x4050202b,
          0x4050a03f,
          0x40512072,
          0x40522082,
          0x4052a0a6,
          0x405320be,
          0x4053a0d1,
          0x405420e6,
          0x4054a109,
          0x40552117,
          0x4055a154,
          0x40562161,
          0x4056a17a,
          0x40572192,
          0x4057a1a5,
          0x405821ba,
          0x4058a1e1,
          0x40592210,
          0x4059a23d,
          0x405a2251,
          0x405aa261,
          0x405b2279,
          0x405ba28a,
          0x405c229d,
          0x405ca2dc,
          0x405d22e9,
          0x405da30e,
          0x405e234c,
          0x405e8ab3,
          0x405f236d,
          0x405fa37a,
          0x40602388,
          0x4060a3aa,
          0x4061240b,
          0x4061a443,
          0x4062245a,
          0x4062a46b,
          0x40632490,
          0x4063a4a5,
          0x406424bc,
          0x4064a4e8,
          0x40652503,
          0x4065a51a,
          0x40662532,
          0x4066a55c,
          0x40672587,
          0x4067a5cc,
          0x40682614,
          0x4068a635,
          0x40692667,
          0x4069a695,
          0x406a26b6,
          0x406aa6d6,
          0x406b285e,
          0x406ba881,
          0x406c2897,
          0x406cab3a,
          0x406d2b69,
          0x406dab91,
          0x406e2bbf,
          0x406eac0c,
          0x406f2c47,
          0x406fac7f,
          0x40702c92,
          0x4070acaf,
          0x40710802,
          0x4071acc1,
          0x40722cd4,
          0x4072ad0a,
          0x40732d22,
          0x407394fa,
          0x40742d36,
          0x4074ad50,
          0x40752d61,
          0x4075ad75,
          0x40762d83,
          0x407692be,
          0x40772da8,
          0x4077adca,
          0x40782de5,
          0x4078ae1e,
          0x40792e35,
          0x4079ae4b,
          0x407a2e77,
          0x407aae8a,
          0x407b2e9f,
          0x407baeb1,
          0x407c2ee2,
          0x407caeeb,
          0x407d2650,
          0x407d9fe4,
          0x407e2dfa,
          0x407ea1f1,
          0x407f1d58,
          0x407f9afe,
          0x40801f9e,
          0x40809d80,
          0x40812094,
          0x40819f78,
          0x40822baa,
          0x40829ae4,
          0x408321cc,
          0x4083a4cd,
          0x40841d94,
          0x4084a229,
          0x408522ae,
          0x4085a3d2,
          0x4086232e,
          0x40869ffe,
          0x40872bf0,
          0x4087a420,
          0x40881b45,
          0x4088a5df,
          0x40891b94,
          0x40899b21,
          0x408a28cf,
          0x408a9912,
          0x408b2ec6,
          0x408bac5c,
          0x408c22be,
          0x408c992e,
          0x408d1df5,
          0x408d9dc6,
          0x408e1f0f,
          0x408ea134,
          0x408f25f3,
          0x408fa3ee,
          0x409025a8,
          0x4090a300,
          0x409128b7,
          0x40919954,
          0x40921be1,
          0x4092ac2b,
          0x40932ced,
          0x4093a00f,
          0x40941da8,
          0x4094a8e8,
          0x4095247c,
          0x4095ae57,
          0x40962bd7,
          0x40969fb7,
          0x4097205a,
          0x40979f5e,
          0x41f42789,
          0x41f9281b,
          0x41fe270e,
          0x41fea92b,
          0x41ff2a1c,
          0x420327a2,
          0x420827c4,
          0x4208a800,
          0x420926f2,
          0x4209a83a,
          0x420a2749,
          0x420aa729,
          0x420b2769,
          0x420ba7e2,
          0x420c2a38,
          0x420ca8f8,
          0x420d2912,
          0x420da949,
          0x42122963,
          0x421729ff,
          0x4217a9a5,
          0x421c29c7,
          0x421f2982,
          0x42212a4f,
          0x422629e2,
          0x422b2b1e,
          0x422baacc,
          0x422c2b06,
          0x422caa8b,
          0x422d2a6a,
          0x422daaeb,
          0x422e2ab1,
          0x4432072d,
          0x4432873c,
          0x44330748,
          0x44338756,
          0x44340769,
          0x4434877a,
          0x44350781,
          0x4435878b,
          0x4436079e,
          0x443687b4,
          0x443707c6,
          0x443787d3,
          0x443807e2,
          0x443887ea,
          0x44390802,
          0x44398810,
          0x443a0823,
          0x483212e8,
          0x483292fa,
          0x48331310,
          0x48339329,
          0x4c32134e,
          0x4c32935e,
          0x4c331371,
          0x4c339391,
          0x4c3400ac,
          0x4c3480ea,
          0x4c35139d,
          0x4c3593ab,
          0x4c3613c7,
          0x4c3693ed,
          0x4c3713fc,
          0x4c37940a,
          0x4c38141f,
          0x4c38942b,
          0x4c39144b,
          0x4c399475,
          0x4c3a148e,
          0x4c3a94a7,
          0x4c3b05fd,
          0x4c3b94c0,
          0x4c3c14d2,
          0x4c3c94e1,
          0x4c3d14fa,
          0x4c3d8c47,
          0x4c3e1567,
          0x4c3e9509,
          0x4c3f1589,
          0x4c3f92be,
          0x4c40151f,
          0x4c40933a,
          0x4c411557,
          0x4c4193da,
          0x4c421543,
          0x50323141,
          0x5032b150,
          0x5033315b,
          0x5033b16b,
          0x50343184,
          0x5034b19e,
          0x503531ac,
          0x5035b1c2,
          0x503631d4,
          0x5036b1ea,
          0x50373203,
          0x5037b216,
          0x5038322e,
          0x5038b23f,
          0x50393254,
          0x5039b268,
          0x503a3288,
          0x503ab29e,
          0x503b32b6,
          0x503bb2c8,
          0x503c32e4,
          0x503cb2fb,
          0x503d3314,
          0x503db32a,
          0x503e3337,
          0x503eb34d,
          0x503f335f,
          0x503f837b,
          0x50403372,
          0x5040b382,
          0x5041339c,
          0x5041b3ab,
          0x504233c5,
          0x5042b3e2,
          0x504333f2,
          0x5043b402,
          0x50443411,
          0x50448431,
          0x50453425,
          0x5045b443,
          0x50463456,
          0x5046b46c,
          0x5047347e,
          0x5047b493,
          0x504834b9,
          0x5048b4c7,
          0x504934da,
          0x5049b4ef,
          0x504a3505,
          0x504ab515,
          0x504b3535,
          0x504bb548,
          0x504c356b,
          0x504cb599,
          0x504d35ab,
          0x504db5c8,
          0x504e35e3,
          0x504eb5ff,
          0x504f3611,
          0x504fb628,
          0x50503637,
          0x505086f1,
          0x5051364a,
          0x58320f65,
          0x68320f27,
          0x68328c7f,
          0x68330c92,
          0x68338f35,
          0x68340f45,
          0x683480ea,
          0x6c320eed,
          0x6c328c36,
          0x6c330ef8,
          0x6c338f11,
          0x74320a1b,
          0x743280ac,
          0x74330c47,
          0x78320980,
          0x78328995,
          0x783309a1,
          0x78338083,
          0x783409b0,
          0x783489c5,
          0x783509e4,
          0x78358a06,
          0x78360a1b,
          0x78368a31,
          0x78370a41,
          0x78378a62,
          0x78380a75,
          0x78388a87,
          0x78390a94,
          0x78398ab3,
          0x783a0ac8,
          0x783a8ad6,
          0x783b0ae0,
          0x783b8af4,
          0x783c0b0b,
          0x783c8b20,
          0x783d0b37,
          0x783d8b4c,
          0x783e0aa2,
          0x783e8a54,
          0x7c3211d7,
      };
      
      const size_t kOpenSSLReasonValuesLen = sizeof(kOpenSSLReasonValues) / sizeof(kOpenSSLReasonValues[0]);
      
      const char kOpenSSLReasonStringData[] =
          "ASN1_LENGTH_MISMATCH\\0"
          "AUX_ERROR\\0"
          "BAD_GET_ASN1_OBJECT_CALL\\0"
          "BAD_OBJECT_HEADER\\0"
          "BMPSTRING_IS_WRONG_LENGTH\\0"
          "BN_LIB\\0"
          "BOOLEAN_IS_WRONG_LENGTH\\0"
          "BUFFER_TOO_SMALL\\0"
          "CONTEXT_NOT_INITIALISED\\0"
          "DECODE_ERROR\\0"
          "DEPTH_EXCEEDED\\0"
          "DIGEST_AND_KEY_TYPE_NOT_SUPPORTED\\0"
          "ENCODE_ERROR\\0"
          "ERROR_GETTING_TIME\\0"
          "EXPECTING_AN_ASN1_SEQUENCE\\0"
          "EXPECTING_AN_INTEGER\\0"
          "EXPECTING_AN_OBJECT\\0"
          "EXPECTING_A_BOOLEAN\\0"
          "EXPECTING_A_TIME\\0"
          "EXPLICIT_LENGTH_MISMATCH\\0"
          "EXPLICIT_TAG_NOT_CONSTRUCTED\\0"
          "FIELD_MISSING\\0"
          "FIRST_NUM_TOO_LARGE\\0"
          "HEADER_TOO_LONG\\0"
          "ILLEGAL_BITSTRING_FORMAT\\0"
          "ILLEGAL_BOOLEAN\\0"
          "ILLEGAL_CHARACTERS\\0"
          "ILLEGAL_FORMAT\\0"
          "ILLEGAL_HEX\\0"
          "ILLEGAL_IMPLICIT_TAG\\0"
          "ILLEGAL_INTEGER\\0"
          "ILLEGAL_NESTED_TAGGING\\0"
          "ILLEGAL_NULL\\0"
          "ILLEGAL_NULL_VALUE\\0"
          "ILLEGAL_OBJECT\\0"
          "ILLEGAL_OPTIONAL_ANY\\0"
          "ILLEGAL_OPTIONS_ON_ITEM_TEMPLATE\\0"
          "ILLEGAL_TAGGED_ANY\\0"
          "ILLEGAL_TIME_VALUE\\0"
          "INTEGER_NOT_ASCII_FORMAT\\0"
          "INTEGER_TOO_LARGE_FOR_LONG\\0"
          "INVALID_BIT_STRING_BITS_LEFT\\0"
          "INVALID_BMPSTRING\\0"
          "INVALID_DIGIT\\0"
          "INVALID_MODIFIER\\0"
          "INVALID_NUMBER\\0"
          "INVALID_OBJECT_ENCODING\\0"
          "INVALID_SEPARATOR\\0"
          "INVALID_TIME_FORMAT\\0"
          "INVALID_UNIVERSALSTRING\\0"
          "INVALID_UTF8STRING\\0"
          "LIST_ERROR\\0"
          "MISSING_ASN1_EOS\\0"
          "MISSING_EOC\\0"
          "MISSING_SECOND_NUMBER\\0"
          "MISSING_VALUE\\0"
          "MSTRING_NOT_UNIVERSAL\\0"
          "MSTRING_WRONG_TAG\\0"
          "NESTED_ASN1_ERROR\\0"
          "NESTED_ASN1_STRING\\0"
          "NESTED_TOO_DEEP\\0"
          "NON_HEX_CHARACTERS\\0"
          "NOT_ASCII_FORMAT\\0"
          "NOT_ENOUGH_DATA\\0"
          "NO_MATCHING_CHOICE_TYPE\\0"
          "NULL_IS_WRONG_LENGTH\\0"
          "OBJECT_NOT_ASCII_FORMAT\\0"
          "ODD_NUMBER_OF_CHARS\\0"
          "SECOND_NUMBER_TOO_LARGE\\0"
          "SEQUENCE_LENGTH_MISMATCH\\0"
          "SEQUENCE_NOT_CONSTRUCTED\\0"
          "SEQUENCE_OR_SET_NEEDS_CONFIG\\0"
          "SHORT_LINE\\0"
          "STREAMING_NOT_SUPPORTED\\0"
          "STRING_TOO_LONG\\0"
          "STRING_TOO_SHORT\\0"
          "TAG_VALUE_TOO_HIGH\\0"
          "TIME_NOT_ASCII_FORMAT\\0"
          "TOO_LONG\\0"
          "TYPE_NOT_CONSTRUCTED\\0"
          "TYPE_NOT_PRIMITIVE\\0"
          "UNEXPECTED_EOC\\0"
          "UNIVERSALSTRING_IS_WRONG_LENGTH\\0"
          "UNKNOWN_FORMAT\\0"
          "UNKNOWN_MESSAGE_DIGEST_ALGORITHM\\0"
          "UNKNOWN_SIGNATURE_ALGORITHM\\0"
          "UNKNOWN_TAG\\0"
          "UNSUPPORTED_ANY_DEFINED_BY_TYPE\\0"
          "UNSUPPORTED_PUBLIC_KEY_TYPE\\0"
          "UNSUPPORTED_TYPE\\0"
          "WRONG_PUBLIC_KEY_TYPE\\0"
          "WRONG_TAG\\0"
          "WRONG_TYPE\\0"
          "BAD_FOPEN_MODE\\0"
          "BROKEN_PIPE\\0"
          "CONNECT_ERROR\\0"
          "ERROR_SETTING_NBIO\\0"
          "INVALID_ARGUMENT\\0"
          "IN_USE\\0"
          "KEEPALIVE\\0"
          "NBIO_CONNECT_ERROR\\0"
          "NO_HOSTNAME_SPECIFIED\\0"
          "NO_PORT_SPECIFIED\\0"
          "NO_SUCH_FILE\\0"
          "NULL_PARAMETER\\0"
          "SYS_LIB\\0"
          "UNABLE_TO_CREATE_SOCKET\\0"
          "UNINITIALIZED\\0"
          "UNSUPPORTED_METHOD\\0"
          "WRITE_TO_READ_ONLY_BIO\\0"
          "ARG2_LT_ARG3\\0"
          "BAD_ENCODING\\0"
          "BAD_RECIPROCAL\\0"
          "BIGNUM_TOO_LONG\\0"
          "BITS_TOO_SMALL\\0"
          "CALLED_WITH_EVEN_MODULUS\\0"
          "DIV_BY_ZERO\\0"
          "EXPAND_ON_STATIC_BIGNUM_DATA\\0"
          "INPUT_NOT_REDUCED\\0"
          "INVALID_INPUT\\0"
          "INVALID_RANGE\\0"
          "NEGATIVE_NUMBER\\0"
          "NOT_A_SQUARE\\0"
          "NOT_INITIALIZED\\0"
          "NO_INVERSE\\0"
          "PRIVATE_KEY_TOO_LARGE\\0"
          "P_IS_NOT_PRIME\\0"
          "TOO_MANY_ITERATIONS\\0"
          "TOO_MANY_TEMPORARY_VARIABLES\\0"
          "AES_KEY_SETUP_FAILED\\0"
          "BAD_DECRYPT\\0"
          "BAD_KEY_LENGTH\\0"
          "CTRL_NOT_IMPLEMENTED\\0"
          "CTRL_OPERATION_NOT_IMPLEMENTED\\0"
          "DATA_NOT_MULTIPLE_OF_BLOCK_LENGTH\\0"
          "INITIALIZATION_ERROR\\0"
          "INPUT_NOT_INITIALIZED\\0"
          "INVALID_AD_SIZE\\0"
          "INVALID_KEY_LENGTH\\0"
          "INVALID_NONCE\\0"
          "INVALID_NONCE_SIZE\\0"
          "INVALID_OPERATION\\0"
          "IV_TOO_LARGE\\0"
          "NO_CIPHER_SET\\0"
          "NO_DIRECTION_SET\\0"
          "OUTPUT_ALIASES_INPUT\\0"
          "TAG_TOO_LARGE\\0"
          "TOO_LARGE\\0"
          "UNSUPPORTED_AD_SIZE\\0"
          "UNSUPPORTED_INPUT_SIZE\\0"
          "UNSUPPORTED_KEY_SIZE\\0"
          "UNSUPPORTED_NONCE_SIZE\\0"
          "UNSUPPORTED_TAG_SIZE\\0"
          "WRONG_FINAL_BLOCK_LENGTH\\0"
          "LIST_CANNOT_BE_NULL\\0"
          "MISSING_CLOSE_SQUARE_BRACKET\\0"
          "MISSING_EQUAL_SIGN\\0"
          "NO_CLOSE_BRACE\\0"
          "UNABLE_TO_CREATE_NEW_SECTION\\0"
          "VARIABLE_EXPANSION_TOO_LONG\\0"
          "VARIABLE_HAS_NO_VALUE\\0"
          "BAD_GENERATOR\\0"
          "INVALID_PUBKEY\\0"
          "MODULUS_TOO_LARGE\\0"
          "NO_PRIVATE_VALUE\\0"
          "UNKNOWN_HASH\\0"
          "BAD_Q_VALUE\\0"
          "BAD_VERSION\\0"
          "INVALID_PARAMETERS\\0"
          "MISSING_PARAMETERS\\0"
          "NEED_NEW_SETUP_VALUES\\0"
          "BIGNUM_OUT_OF_RANGE\\0"
          "COORDINATES_OUT_OF_RANGE\\0"
          "D2I_ECPKPARAMETERS_FAILURE\\0"
          "EC_GROUP_NEW_BY_NAME_FAILURE\\0"
          "GROUP2PKPARAMETERS_FAILURE\\0"
          "GROUP_MISMATCH\\0"
          "I2D_ECPKPARAMETERS_FAILURE\\0"
          "INCOMPATIBLE_OBJECTS\\0"
          "INVALID_COFACTOR\\0"
          "INVALID_COMPRESSED_POINT\\0"
          "INVALID_COMPRESSION_BIT\\0"
          "INVALID_ENCODING\\0"
          "INVALID_FIELD\\0"
          "INVALID_FORM\\0"
          "INVALID_GROUP_ORDER\\0"
          "INVALID_PRIVATE_KEY\\0"
          "INVALID_SCALAR\\0"
          "MISSING_PRIVATE_KEY\\0"
          "NON_NAMED_CURVE\\0"
          "PKPARAMETERS2GROUP_FAILURE\\0"
          "POINT_AT_INFINITY\\0"
          "POINT_IS_NOT_ON_CURVE\\0"
          "PUBLIC_KEY_VALIDATION_FAILED\\0"
          "SLOT_FULL\\0"
          "UNDEFINED_GENERATOR\\0"
          "UNKNOWN_GROUP\\0"
          "UNKNOWN_ORDER\\0"
          "WRONG_CURVE_PARAMETERS\\0"
          "WRONG_ORDER\\0"
          "KDF_FAILED\\0"
          "POINT_ARITHMETIC_FAILURE\\0"
          "UNKNOWN_DIGEST_LENGTH\\0"
          "BAD_SIGNATURE\\0"
          "NOT_IMPLEMENTED\\0"
          "RANDOM_NUMBER_GENERATION_FAILED\\0"
          "OPERATION_NOT_SUPPORTED\\0"
          "COMMAND_NOT_SUPPORTED\\0"
          "DIFFERENT_KEY_TYPES\\0"
          "DIFFERENT_PARAMETERS\\0"
          "EXPECTING_AN_EC_KEY_KEY\\0"
          "EXPECTING_AN_RSA_KEY\\0"
          "EXPECTING_A_DSA_KEY\\0"
          "ILLEGAL_OR_UNSUPPORTED_PADDING_MODE\\0"
          "INVALID_DIGEST_LENGTH\\0"
          "INVALID_DIGEST_TYPE\\0"
          "INVALID_KEYBITS\\0"
          "INVALID_MGF1_MD\\0"
          "INVALID_PADDING_MODE\\0"
          "INVALID_PEER_KEY\\0"
          "INVALID_PSS_SALTLEN\\0"
          "INVALID_SIGNATURE\\0"
          "KEYS_NOT_SET\\0"
          "MEMORY_LIMIT_EXCEEDED\\0"
          "NOT_A_PRIVATE_KEY\\0"
          "NOT_XOF_OR_INVALID_LENGTH\\0"
          "NO_DEFAULT_DIGEST\\0"
          "NO_KEY_SET\\0"
          "NO_MDC2_SUPPORT\\0"
          "NO_NID_FOR_CURVE\\0"
          "NO_OPERATION_SET\\0"
          "NO_PARAMETERS_SET\\0"
          "OPERATION_NOT_SUPPORTED_FOR_THIS_KEYTYPE\\0"
          "OPERATON_NOT_INITIALIZED\\0"
          "UNKNOWN_PUBLIC_KEY_TYPE\\0"
          "UNSUPPORTED_ALGORITHM\\0"
          "OUTPUT_TOO_LARGE\\0"
          "INVALID_OID_STRING\\0"
          "UNKNOWN_NID\\0"
          "BAD_BASE64_DECODE\\0"
          "BAD_END_LINE\\0"
          "BAD_IV_CHARS\\0"
          "BAD_PASSWORD_READ\\0"
          "CIPHER_IS_NULL\\0"
          "ERROR_CONVERTING_PRIVATE_KEY\\0"
          "NOT_DEK_INFO\\0"
          "NOT_ENCRYPTED\\0"
          "NOT_PROC_TYPE\\0"
          "NO_START_LINE\\0"
          "READ_KEY\\0"
          "SHORT_HEADER\\0"
          "UNSUPPORTED_CIPHER\\0"
          "UNSUPPORTED_ENCRYPTION\\0"
          "BAD_PKCS7_VERSION\\0"
          "NOT_PKCS7_SIGNED_DATA\\0"
          "NO_CERTIFICATES_INCLUDED\\0"
          "NO_CRLS_INCLUDED\\0"
          "BAD_ITERATION_COUNT\\0"
          "BAD_PKCS12_DATA\\0"
          "BAD_PKCS12_VERSION\\0"
          "CIPHER_HAS_NO_OBJECT_IDENTIFIER\\0"
          "CRYPT_ERROR\\0"
          "ENCRYPT_ERROR\\0"
          "ERROR_SETTING_CIPHER_PARAMS\\0"
          "INCORRECT_PASSWORD\\0"
          "INVALID_CHARACTERS\\0"
          "KEYGEN_FAILURE\\0"
          "KEY_GEN_ERROR\\0"
          "METHOD_NOT_SUPPORTED\\0"
          "MISSING_MAC\\0"
          "MULTIPLE_PRIVATE_KEYS_IN_PKCS12\\0"
          "PKCS12_PUBLIC_KEY_INTEGRITY_NOT_SUPPORTED\\0"
          "PKCS12_TOO_DEEPLY_NESTED\\0"
          "PRIVATE_KEY_DECODE_ERROR\\0"
          "PRIVATE_KEY_ENCODE_ERROR\\0"
          "UNKNOWN_ALGORITHM\\0"
          "UNKNOWN_CIPHER\\0"
          "UNKNOWN_CIPHER_ALGORITHM\\0"
          "UNKNOWN_DIGEST\\0"
          "UNSUPPORTED_KEYLENGTH\\0"
          "UNSUPPORTED_KEY_DERIVATION_FUNCTION\\0"
          "UNSUPPORTED_OPTIONS\\0"
          "UNSUPPORTED_PRF\\0"
          "UNSUPPORTED_PRIVATE_KEY_ALGORITHM\\0"
          "UNSUPPORTED_SALT_TYPE\\0"
          "BAD_E_VALUE\\0"
          "BAD_FIXED_HEADER_DECRYPT\\0"
          "BAD_PAD_BYTE_COUNT\\0"
          "BAD_RSA_PARAMETERS\\0"
          "BLOCK_TYPE_IS_NOT_01\\0"
          "BLOCK_TYPE_IS_NOT_02\\0"
          "BN_NOT_INITIALIZED\\0"
          "CANNOT_RECOVER_MULTI_PRIME_KEY\\0"
          "CRT_PARAMS_ALREADY_GIVEN\\0"
          "CRT_VALUES_INCORRECT\\0"
          "DATA_LEN_NOT_EQUAL_TO_MOD_LEN\\0"
          "DATA_TOO_LARGE\\0"
          "DATA_TOO_LARGE_FOR_KEY_SIZE\\0"
          "DATA_TOO_LARGE_FOR_MODULUS\\0"
          "DATA_TOO_SMALL\\0"
          "DATA_TOO_SMALL_FOR_KEY_SIZE\\0"
          "DIGEST_TOO_BIG_FOR_RSA_KEY\\0"
          "D_E_NOT_CONGRUENT_TO_1\\0"
          "D_OUT_OF_RANGE\\0"
          "EMPTY_PUBLIC_KEY\\0"
          "FIRST_OCTET_INVALID\\0"
          "INCONSISTENT_SET_OF_CRT_VALUES\\0"
          "INTERNAL_ERROR\\0"
          "INVALID_MESSAGE_LENGTH\\0"
          "KEY_SIZE_TOO_SMALL\\0"
          "LAST_OCTET_INVALID\\0"
          "MUST_HAVE_AT_LEAST_TWO_PRIMES\\0"
          "NO_PUBLIC_EXPONENT\\0"
          "NULL_BEFORE_BLOCK_MISSING\\0"
          "N_NOT_EQUAL_P_Q\\0"
          "OAEP_DECODING_ERROR\\0"
          "ONLY_ONE_OF_P_Q_GIVEN\\0"
          "OUTPUT_BUFFER_TOO_SMALL\\0"
          "PADDING_CHECK_FAILED\\0"
          "PKCS_DECODING_ERROR\\0"
          "SLEN_CHECK_FAILED\\0"
          "SLEN_RECOVERY_FAILED\\0"
          "UNKNOWN_ALGORITHM_TYPE\\0"
          "UNKNOWN_PADDING_TYPE\\0"
          "VALUE_MISSING\\0"
          "WRONG_SIGNATURE_LENGTH\\0"
          "ALPN_MISMATCH_ON_EARLY_DATA\\0"
          "APPLICATION_DATA_INSTEAD_OF_HANDSHAKE\\0"
          "APPLICATION_DATA_ON_SHUTDOWN\\0"
          "APP_DATA_IN_HANDSHAKE\\0"
          "ATTEMPT_TO_REUSE_SESSION_IN_DIFFERENT_CONTEXT\\0"
          "BAD_ALERT\\0"
          "BAD_CHANGE_CIPHER_SPEC\\0"
          "BAD_DATA_RETURNED_BY_CALLBACK\\0"
          "BAD_DH_P_LENGTH\\0"
          "BAD_DIGEST_LENGTH\\0"
          "BAD_ECC_CERT\\0"
          "BAD_ECPOINT\\0"
          "BAD_HANDSHAKE_RECORD\\0"
          "BAD_HELLO_REQUEST\\0"
          "BAD_LENGTH\\0"
          "BAD_PACKET_LENGTH\\0"
          "BAD_RSA_ENCRYPT\\0"
          "BAD_SRTP_MKI_VALUE\\0"
          "BAD_SRTP_PROTECTION_PROFILE_LIST\\0"
          "BAD_SSL_FILETYPE\\0"
          "BAD_WRITE_RETRY\\0"
          "BIO_NOT_SET\\0"
          "BLOCK_CIPHER_PAD_IS_WRONG\\0"
          "BUFFERED_MESSAGES_ON_CIPHER_CHANGE\\0"
          "CANNOT_HAVE_BOTH_PRIVKEY_AND_METHOD\\0"
          "CANNOT_PARSE_LEAF_CERT\\0"
          "CA_DN_LENGTH_MISMATCH\\0"
          "CA_DN_TOO_LONG\\0"
          "CCS_RECEIVED_EARLY\\0"
          "CERTIFICATE_AND_PRIVATE_KEY_MISMATCH\\0"
          "CERTIFICATE_VERIFY_FAILED\\0"
          "CERT_CB_ERROR\\0"
          "CERT_DECOMPRESSION_FAILED\\0"
          "CERT_LENGTH_MISMATCH\\0"
          "CHANNEL_ID_NOT_P256\\0"
          "CHANNEL_ID_SIGNATURE_INVALID\\0"
          "CIPHER_OR_HASH_UNAVAILABLE\\0"
          "CLIENTHELLO_PARSE_FAILED\\0"
          "CLIENTHELLO_TLSEXT\\0"
          "CONNECTION_REJECTED\\0"
          "CONNECTION_TYPE_NOT_SET\\0"
          "CUSTOM_EXTENSION_ERROR\\0"
          "DATA_LENGTH_TOO_LONG\\0"
          "DECRYPTION_FAILED\\0"
          "DECRYPTION_FAILED_OR_BAD_RECORD_MAC\\0"
          "DH_PUBLIC_VALUE_LENGTH_IS_WRONG\\0"
          "DH_P_TOO_LONG\\0"
          "DIGEST_CHECK_FAILED\\0"
          "DOWNGRADE_DETECTED\\0"
          "DTLS_MESSAGE_TOO_BIG\\0"
          "DUPLICATE_EXTENSION\\0"
          "DUPLICATE_KEY_SHARE\\0"
          "DUPLICATE_SIGNATURE_ALGORITHM\\0"
          "EARLY_DATA_NOT_IN_USE\\0"
          "ECC_CERT_NOT_FOR_SIGNING\\0"
          "EMPTY_HELLO_RETRY_REQUEST\\0"
          "EMS_STATE_INCONSISTENT\\0"
          "ENCRYPTED_LENGTH_TOO_LONG\\0"
          "ERROR_ADDING_EXTENSION\\0"
          "ERROR_IN_RECEIVED_CIPHER_LIST\\0"
          "ERROR_PARSING_EXTENSION\\0"
          "EXCESSIVE_MESSAGE_SIZE\\0"
          "EXTRA_DATA_IN_MESSAGE\\0"
          "FRAGMENT_MISMATCH\\0"
          "GOT_NEXT_PROTO_WITHOUT_EXTENSION\\0"
          "HANDSHAKE_FAILURE_ON_CLIENT_HELLO\\0"
          "HANDSHAKE_NOT_COMPLETE\\0"
          "HTTPS_PROXY_REQUEST\\0"
          "HTTP_REQUEST\\0"
          "INAPPROPRIATE_FALLBACK\\0"
          "INCONSISTENT_CLIENT_HELLO\\0"
          "INVALID_ALPN_PROTOCOL\\0"
          "INVALID_COMMAND\\0"
          "INVALID_COMPRESSION_LIST\\0"
          "INVALID_DELEGATED_CREDENTIAL\\0"
          "INVALID_MESSAGE\\0"
          "INVALID_OUTER_RECORD_TYPE\\0"
          "INVALID_SCT_LIST\\0"
          "INVALID_SIGNATURE_ALGORITHM\\0"
          "INVALID_SSL_SESSION\\0"
          "INVALID_TICKET_KEYS_LENGTH\\0"
          "KEY_USAGE_BIT_INCORRECT\\0"
          "LENGTH_MISMATCH\\0"
          "MISSING_EXTENSION\\0"
          "MISSING_KEY_SHARE\\0"
          "MISSING_RSA_CERTIFICATE\\0"
          "MISSING_TMP_DH_KEY\\0"
          "MISSING_TMP_ECDH_KEY\\0"
          "MIXED_SPECIAL_OPERATOR_WITH_GROUPS\\0"
          "MTU_TOO_SMALL\\0"
          "NEGOTIATED_BOTH_NPN_AND_ALPN\\0"
          "NEGOTIATED_TB_WITHOUT_EMS_OR_RI\\0"
          "NESTED_GROUP\\0"
          "NO_CERTIFICATES_RETURNED\\0"
          "NO_CERTIFICATE_ASSIGNED\\0"
          "NO_CERTIFICATE_SET\\0"
          "NO_CIPHERS_AVAILABLE\\0"
          "NO_CIPHERS_PASSED\\0"
          "NO_CIPHERS_SPECIFIED\\0"
          "NO_CIPHER_MATCH\\0"
          "NO_COMMON_SIGNATURE_ALGORITHMS\\0"
          "NO_COMPRESSION_SPECIFIED\\0"
          "NO_GROUPS_SPECIFIED\\0"
          "NO_METHOD_SPECIFIED\\0"
          "NO_P256_SUPPORT\\0"
          "NO_PRIVATE_KEY_ASSIGNED\\0"
          "NO_RENEGOTIATION\\0"
          "NO_REQUIRED_DIGEST\\0"
          "NO_SHARED_CIPHER\\0"
          "NO_SHARED_GROUP\\0"
          "NO_SUPPORTED_VERSIONS_ENABLED\\0"
          "NULL_SSL_CTX\\0"
          "NULL_SSL_METHOD_PASSED\\0"
          "OCSP_CB_ERROR\\0"
          "OLD_SESSION_CIPHER_NOT_RETURNED\\0"
          "OLD_SESSION_PRF_HASH_MISMATCH\\0"
          "OLD_SESSION_VERSION_NOT_RETURNED\\0"
          "PARSE_TLSEXT\\0"
          "PATH_TOO_LONG\\0"
          "PEER_DID_NOT_RETURN_A_CERTIFICATE\\0"
          "PEER_ERROR_UNSUPPORTED_CERTIFICATE_TYPE\\0"
          "PRE_SHARED_KEY_MUST_BE_LAST\\0"
          "PRIVATE_KEY_OPERATION_FAILED\\0"
          "PROTOCOL_IS_SHUTDOWN\\0"
          "PSK_IDENTITY_BINDER_COUNT_MISMATCH\\0"
          "PSK_IDENTITY_NOT_FOUND\\0"
          "PSK_NO_CLIENT_CB\\0"
          "PSK_NO_SERVER_CB\\0"
          "QUIC_INTERNAL_ERROR\\0"
          "READ_TIMEOUT_EXPIRED\\0"
          "RECORD_LENGTH_MISMATCH\\0"
          "RECORD_TOO_LARGE\\0"
          "RENEGOTIATION_EMS_MISMATCH\\0"
          "RENEGOTIATION_ENCODING_ERR\\0"
          "RENEGOTIATION_MISMATCH\\0"
          "REQUIRED_CIPHER_MISSING\\0"
          "RESUMED_EMS_SESSION_WITHOUT_EMS_EXTENSION\\0"
          "RESUMED_NON_EMS_SESSION_WITH_EMS_EXTENSION\\0"
          "SCSV_RECEIVED_WHEN_RENEGOTIATING\\0"
          "SECOND_SERVERHELLO_VERSION_MISMATCH\\0"
          "SERVERHELLO_TLSEXT\\0"
          "SERVER_CERT_CHANGED\\0"
          "SERVER_ECHOED_INVALID_SESSION_ID\\0"
          "SESSION_ID_CONTEXT_UNINITIALIZED\\0"
          "SESSION_MAY_NOT_BE_CREATED\\0"
          "SHUTDOWN_WHILE_IN_INIT\\0"
          "SIGNATURE_ALGORITHMS_EXTENSION_SENT_BY_SERVER\\0"
          "SRTP_COULD_NOT_ALLOCATE_PROFILES\\0"
          "SRTP_UNKNOWN_PROTECTION_PROFILE\\0"
          "SSL3_EXT_INVALID_SERVERNAME\\0"
          "SSLV3_ALERT_BAD_CERTIFICATE\\0"
          "SSLV3_ALERT_BAD_RECORD_MAC\\0"
          "SSLV3_ALERT_CERTIFICATE_EXPIRED\\0"
          "SSLV3_ALERT_CERTIFICATE_REVOKED\\0"
          "SSLV3_ALERT_CERTIFICATE_UNKNOWN\\0"
          "SSLV3_ALERT_CLOSE_NOTIFY\\0"
          "SSLV3_ALERT_DECOMPRESSION_FAILURE\\0"
          "SSLV3_ALERT_HANDSHAKE_FAILURE\\0"
          "SSLV3_ALERT_ILLEGAL_PARAMETER\\0"
          "SSLV3_ALERT_NO_CERTIFICATE\\0"
          "SSLV3_ALERT_UNEXPECTED_MESSAGE\\0"
          "SSLV3_ALERT_UNSUPPORTED_CERTIFICATE\\0"
          "SSL_CTX_HAS_NO_DEFAULT_SSL_VERSION\\0"
          "SSL_HANDSHAKE_FAILURE\\0"
          "SSL_SESSION_ID_CONTEXT_TOO_LONG\\0"
          "SSL_SESSION_ID_TOO_LONG\\0"
          "TICKET_ENCRYPTION_FAILED\\0"
          "TLS13_DOWNGRADE\\0"
          "TLSV1_ALERT_ACCESS_DENIED\\0"
          "TLSV1_ALERT_DECODE_ERROR\\0"
          "TLSV1_ALERT_DECRYPTION_FAILED\\0"
          "TLSV1_ALERT_DECRYPT_ERROR\\0"
          "TLSV1_ALERT_EXPORT_RESTRICTION\\0"
          "TLSV1_ALERT_INAPPROPRIATE_FALLBACK\\0"
          "TLSV1_ALERT_INSUFFICIENT_SECURITY\\0"
          "TLSV1_ALERT_INTERNAL_ERROR\\0"
          "TLSV1_ALERT_NO_RENEGOTIATION\\0"
          "TLSV1_ALERT_PROTOCOL_VERSION\\0"
          "TLSV1_ALERT_RECORD_OVERFLOW\\0"
          "TLSV1_ALERT_UNKNOWN_CA\\0"
          "TLSV1_ALERT_USER_CANCELLED\\0"
          "TLSV1_BAD_CERTIFICATE_HASH_VALUE\\0"
          "TLSV1_BAD_CERTIFICATE_STATUS_RESPONSE\\0"
          "TLSV1_CERTIFICATE_REQUIRED\\0"
          "TLSV1_CERTIFICATE_UNOBTAINABLE\\0"
          "TLSV1_UNKNOWN_PSK_IDENTITY\\0"
          "TLSV1_UNRECOGNIZED_NAME\\0"
          "TLSV1_UNSUPPORTED_EXTENSION\\0"
          "TLS_PEER_DID_NOT_RESPOND_WITH_CERTIFICATE_LIST\\0"
          "TLS_RSA_ENCRYPTED_VALUE_LENGTH_IS_WRONG\\0"
          "TOO_MANY_EMPTY_FRAGMENTS\\0"
          "TOO_MANY_KEY_UPDATES\\0"
          "TOO_MANY_WARNING_ALERTS\\0"
          "TOO_MUCH_READ_EARLY_DATA\\0"
          "TOO_MUCH_SKIPPED_EARLY_DATA\\0"
          "UNABLE_TO_FIND_ECDH_PARAMETERS\\0"
          "UNCOMPRESSED_CERT_TOO_LARGE\\0"
          "UNEXPECTED_EXTENSION\\0"
          "UNEXPECTED_EXTENSION_ON_EARLY_DATA\\0"
          "UNEXPECTED_MESSAGE\\0"
          "UNEXPECTED_OPERATOR_IN_GROUP\\0"
          "UNEXPECTED_RECORD\\0"
          "UNKNOWN_ALERT_TYPE\\0"
          "UNKNOWN_CERTIFICATE_TYPE\\0"
          "UNKNOWN_CERT_COMPRESSION_ALG\\0"
          "UNKNOWN_CIPHER_RETURNED\\0"
          "UNKNOWN_CIPHER_TYPE\\0"
          "UNKNOWN_KEY_EXCHANGE_TYPE\\0"
          "UNKNOWN_PROTOCOL\\0"
          "UNKNOWN_SSL_VERSION\\0"
          "UNKNOWN_STATE\\0"
          "UNSAFE_LEGACY_RENEGOTIATION_DISABLED\\0"
          "UNSUPPORTED_COMPRESSION_ALGORITHM\\0"
          "UNSUPPORTED_ELLIPTIC_CURVE\\0"
          "UNSUPPORTED_PROTOCOL\\0"
          "UNSUPPORTED_PROTOCOL_FOR_CUSTOM_KEY\\0"
          "WRONG_CERTIFICATE_TYPE\\0"
          "WRONG_CIPHER_RETURNED\\0"
          "WRONG_CURVE\\0"
          "WRONG_ENCRYPTION_LEVEL_RECEIVED\\0"
          "WRONG_MESSAGE_TYPE\\0"
          "WRONG_SIGNATURE_TYPE\\0"
          "WRONG_SSL_VERSION\\0"
          "WRONG_VERSION_NUMBER\\0"
          "WRONG_VERSION_ON_EARLY_DATA\\0"
          "X509_LIB\\0"
          "X509_VERIFICATION_SETUP_PROBLEMS\\0"
          "AKID_MISMATCH\\0"
          "BAD_X509_FILETYPE\\0"
          "BASE64_DECODE_ERROR\\0"
          "CANT_CHECK_DH_KEY\\0"
          "CERT_ALREADY_IN_HASH_TABLE\\0"
          "CRL_ALREADY_DELTA\\0"
          "CRL_VERIFY_FAILURE\\0"
          "IDP_MISMATCH\\0"
          "INVALID_DIRECTORY\\0"
          "INVALID_FIELD_NAME\\0"
          "INVALID_PARAMETER\\0"
          "INVALID_PSS_PARAMETERS\\0"
          "INVALID_TRUST\\0"
          "ISSUER_MISMATCH\\0"
          "KEY_TYPE_MISMATCH\\0"
          "KEY_VALUES_MISMATCH\\0"
          "LOADING_CERT_DIR\\0"
          "LOADING_DEFAULTS\\0"
          "NAME_TOO_LONG\\0"
          "NEWER_CRL_NOT_NEWER\\0"
          "NO_CERT_SET_FOR_US_TO_VERIFY\\0"
          "NO_CRL_NUMBER\\0"
          "PUBLIC_KEY_DECODE_ERROR\\0"
          "PUBLIC_KEY_ENCODE_ERROR\\0"
          "SHOULD_RETRY\\0"
          "SIGNATURE_ALGORITHM_MISMATCH\\0"
          "UNKNOWN_KEY_TYPE\\0"
          "UNKNOWN_PURPOSE_ID\\0"
          "UNKNOWN_TRUST_ID\\0"
          "WRONG_LOOKUP_TYPE\\0"
          "BAD_IP_ADDRESS\\0"
          "BAD_OBJECT\\0"
          "BN_DEC2BN_ERROR\\0"
          "BN_TO_ASN1_INTEGER_ERROR\\0"
          "CANNOT_FIND_FREE_FUNCTION\\0"
          "DIRNAME_ERROR\\0"
          "DISTPOINT_ALREADY_SET\\0"
          "DUPLICATE_ZONE_ID\\0"
          "ERROR_CONVERTING_ZONE\\0"
          "ERROR_CREATING_EXTENSION\\0"
          "ERROR_IN_EXTENSION\\0"
          "EXPECTED_A_SECTION_NAME\\0"
          "EXTENSION_EXISTS\\0"
          "EXTENSION_NAME_ERROR\\0"
          "EXTENSION_NOT_FOUND\\0"
          "EXTENSION_SETTING_NOT_SUPPORTED\\0"
          "EXTENSION_VALUE_ERROR\\0"
          "ILLEGAL_EMPTY_EXTENSION\\0"
          "ILLEGAL_HEX_DIGIT\\0"
          "INCORRECT_POLICY_SYNTAX_TAG\\0"
          "INVALID_BOOLEAN_STRING\\0"
          "INVALID_EXTENSION_STRING\\0"
          "INVALID_MULTIPLE_RDNS\\0"
          "INVALID_NAME\\0"
          "INVALID_NULL_ARGUMENT\\0"
          "INVALID_NULL_NAME\\0"
          "INVALID_NULL_VALUE\\0"
          "INVALID_NUMBERS\\0"
          "INVALID_OBJECT_IDENTIFIER\\0"
          "INVALID_OPTION\\0"
          "INVALID_POLICY_IDENTIFIER\\0"
          "INVALID_PROXY_POLICY_SETTING\\0"
          "INVALID_PURPOSE\\0"
          "INVALID_SECTION\\0"
          "INVALID_SYNTAX\\0"
          "ISSUER_DECODE_ERROR\\0"
          "NEED_ORGANIZATION_AND_NUMBERS\\0"
          "NO_CONFIG_DATABASE\\0"
          "NO_ISSUER_CERTIFICATE\\0"
          "NO_ISSUER_DETAILS\\0"
          "NO_POLICY_IDENTIFIER\\0"
          "NO_PROXY_CERT_POLICY_LANGUAGE_DEFINED\\0"
          "NO_PUBLIC_KEY\\0"
          "NO_SUBJECT_DETAILS\\0"
          "ODD_NUMBER_OF_DIGITS\\0"
          "OPERATION_NOT_DEFINED\\0"
          "OTHERNAME_ERROR\\0"
          "POLICY_LANGUAGE_ALREADY_DEFINED\\0"
          "POLICY_PATH_LENGTH\\0"
          "POLICY_PATH_LENGTH_ALREADY_DEFINED\\0"
          "POLICY_WHEN_PROXY_LANGUAGE_REQUIRES_NO_POLICY\\0"
          "SECTION_NOT_FOUND\\0"
          "UNABLE_TO_GET_ISSUER_DETAILS\\0"
          "UNABLE_TO_GET_ISSUER_KEYID\\0"
          "UNKNOWN_BIT_STRING_ARGUMENT\\0"
          "UNKNOWN_EXTENSION\\0"
          "UNKNOWN_EXTENSION_NAME\\0"
          "UNKNOWN_OPTION\\0"
          "UNSUPPORTED_OPTION\\0"
          "USER_TOO_LONG\\0"
          "";
      
    EOF

    # Grab prefix header from GCS
    curl -o include/openssl/boringssl_prefix_symbols.h https://storage.googleapis.com/grpc_boringssl_prefix_headers/boringssl_prefix_symbols-7f02881e96e51f1873afcf384d02f782b48967ca.h

    # We are renaming openssl to openssl_grpc so that there is no conflict with openssl if it exists
    find . -type f \\( -path '*.h' -or -path '*.cc' -or -path '*.c' \\) -print0 | xargs -0 -L1 sed -E -i'.grpc_back' 's;#include <openssl/;#include <openssl_grpc/;g'
    # BoringSSL include boringssl_prefix_symbols.h without any prefix, which does not match the

    # Xcode import style. We add it here so that Xcode knows where to find it.
    find . -type f \\( -path '*.h' -or -path '*.cc' -or -path '*.c' \\) -print0 | xargs -0 -L1 sed -E -i'.grpc_back' 's;#include <boringssl_prefix_symbols.h>;#include <openssl_grpc/boringssl_prefix_symbols.h>;g'
  END_OF_COMMAND
end
