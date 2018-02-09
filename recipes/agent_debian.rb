# Copyright 2017 Google Inc.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Installs the Google Cloud Logging Agent to a Debian based machine.
#
# Derived from Logging Agent's installation script:
#   https://dl.google.com/cloudagents/install-logging-agent.sh
#
# For more details please visit:
#   https://cloud.google.com/logging/docs/agent/installation

repo_host = 'packages.cloud.google.com'
codename = 'wheezy'  # Debian packages are bundled in 'wheezy'

apt_repository 'google-cloud-logging' do
  repo_name 'main'
  components ['main']
  uri "http://#{repo_host}/apt"
  distribution "google-cloud-logging-#{codename}"
  keyserver 'pgp.mit.edu'
  key 'D0BC747FD8CAF7117500D6FA3746C208A7317B0F'
end

package 'google-fluentd' do
  action :install
end

package 'google-fluentd-catch-all-config' do
  action :install
end

service 'google-fluentd' do
  action [:enable, :start]
end
