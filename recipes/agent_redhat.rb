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

# Installs the Google Cloud Logging Agent to a RedHat based machine.
#
# Derived from Logging Agent's installation script:
#   https://dl.google.com/cloudagents/install-logging-agent.sh
#
# For more details please visit:
#   https://cloud.google.com/logging/docs/agent/installation

os_major = node[:platform_version].split('.').first
repo_name = "google-cloud-logging-el#{os_major}-$basearch"
cloud_yum_repo = 'https://packages.cloud.google.com/yum/repos'

yum_repository 'google_cloud_logging' do
  action :create
  name 'google-cloud-logging'
  description 'Google Cloud Logging Agent Repository'
  baseurl "#{cloud_yum_repo}/#{repo_name}"
  enabled true
  gpgcheck true
  repo_gpgcheck true
  gpgkey [
    'https://packages.cloud.google.com/yum/doc/yum-key.gpg',
    'https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg'
  ]
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
