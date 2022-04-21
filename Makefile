# Copyright 2022 Cartesi Pte. Ltd.
#
# SPDX-License-Identifier: Apache-2.0
# Licensed under the Apache License, Version 2.0 (the "License"); you may not use
# this file except in compliance with the License. You may obtain a copy of the
# License at http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software distributed
# under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
# CONDITIONS OF ANY KIND, either express or implied. See the License for the
# specific language governing permissions and limitations under the License.

MACHINE_DIR := machine

.PHONY: clean console

$(MACHINE_DIR):
	@make -C server
	@mv server/machine $@

console:
	@make -C server console

clean:
	@make -C server clean
	@rm -rf $(MACHINE_DIR)

prod-mode:
	docker-compose up --build

host-mode:
	docker-compose -f docker-compose.yml -f docker-compose-host.yml up --build

shutdown:
	docker-compose down -v


