// Copyright 2014 Brian Swetland <swetland@frotz.net>
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

(* keep_hierarchy = "yes" *)
module sync_oneway(
	input txclk,
	input txdat,
	input rxclk,
	output rxdat
	);

reg a, b, c;

always_ff @(posedge txclk)
	a <= txdat;

always_ff @(posedge rxclk) begin
	b <= a;
	c <= b;
end

assign rxdat = c;

endmodule
