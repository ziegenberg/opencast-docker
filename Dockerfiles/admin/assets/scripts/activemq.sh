#!/bin/bash
#
# Copyright 2016 The WWU eLectures Team All rights reserved.
#
# Licensed under the Educational Community License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License. You may obtain a copy of the License at
#
#     http://opensource.org/licenses/ECL-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -e

Opencast::ActiveMQ::Check() {
  echo "Run Opencast::ActiveMQ::Check"

  Opencast::Helper::CheckForVariables \
    "ACTIVEMQ_BROKER_URL" \
    "ACTIVEMQ_BROKER_USERNAME" \
    "ACTIVEMQ_BROKER_PASSWORD"
}

Opencast::ActiveMQ::Configure() {
  echo "Run Opencast::ActiveMQ::Configure"

  Opencast::Helper::ReplaceInfile "etc/custom.properties" \
    "ACTIVEMQ_BROKER_URL" \
    "ACTIVEMQ_BROKER_USERNAME" \
    "ACTIVEMQ_BROKER_PASSWORD"
}

Opencast::ActiveMQ::PrintActivemq.xml() {
  # TODO: read env variables and add config for jaasAuthenticationPlugin
  cat /opencast/docs/scripts/activemq/activemq.xml
}
