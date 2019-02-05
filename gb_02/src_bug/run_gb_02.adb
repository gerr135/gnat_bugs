--
-- a test unit.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--

with Ada.Text_IO; use Ada.Text_IO;

with lists.dynamic;

procedure run_gb_02 is

    type TstType is new Integer;
    package PL  is new Lists(Natural, TstType);
    package PLD is new PL.dynamic;

begin  -- main
    Null;
end run_gb_02;
