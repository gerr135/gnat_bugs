--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--

with root.child;

procedure run_alt1 is

    -- NOTE: these two lines will not compile, as it is impossible to define vars of abstract type.
    -- The purpose here is just to test compiler. If it gets here and complains, then all is good..
    BT : Root.Child.Base_Type;
    DT : Root.Child.Derived_Type;

begin
    null;
end run_alt1;
