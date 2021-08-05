# Copyright:: 2021 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Read node attributes
node = json('/tmp/kitchen/dna.json').params

describe service('stackdriver-agent') do
  if node['package_state'] == 'present'
    it { should be_installed }
    it { should be_enabled }
    it { should be_running }
  else
    # commented out the installed check
    # because it is not reporting correctly
    it { should_not be_installed }
    it { should_not be_enabled }
    it { should_not be_running }
  end
end

describe file('/etc/stackdriver/collectd.conf') do
  if node['package_state'] == 'present'
    it { should exist }

    # when custom config is set, ensure the file was placed correctly
    if node['main_config'] != ''
      its('owner') { should eq 'root' }
      its('group') { should eq 'root' }
      its('sha256sum') { should eq '3728ed856744b0ac9afd78081e3147aec6f1f198d3a9307c43ed4beee0f9d188' }
    end
  end
end

if node['package_state'] == 'present' && node['additional_config_dir'] != ''
  describe file('/etc/stackdriver/collectd.d/example_plugin.conf') do
    it { should exist }
    its('owner') { should eq 'root' }
    its('group') { should eq 'root' }
    its('sha256sum') { should eq '8b68d474a8115aab18e61eb877a7c8a16715cd8346c98c9d645ef0813fbcb02f' }
  end
end
