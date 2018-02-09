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

# Installs the Google Cloud Logging Agent to the machine.
#
# For more details please visit:
#   https://cloud.google.com/logging/docs/agent/installation

case node[:platform_family]
  when 'rhel'
    # Redhat family operating systems
    include_recipe 'google-glogging::agent_redhat'
  when 'debian'
    # Debian family operating systems
    include_recipe 'google-glogging::agent_debian'
  when 'windows'
    # Windows operating systems
    raise 'Windows not yet supported.'
  else
    raise 'Unsupported operating system.'
end
