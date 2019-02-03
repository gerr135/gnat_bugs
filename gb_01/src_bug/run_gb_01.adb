-- 
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--

with root.child1.child2;

procedure run_gb_01 is

    package R   is new Root(Real => Float); 
    package RC  is new R.child1; 
    package RCC is new RC.child2; 

begin 
    null; 
end run_gb_01;
