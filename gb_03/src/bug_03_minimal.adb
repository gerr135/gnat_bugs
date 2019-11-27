--
-- Short demo of the bug inducing code: tagged hierarchy as a field of discriminated record
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--

with lists.Fixed;

procedure bug_03_minimal is

    package PL  is new Lists(Natural, Integer);
    package PLF is new PL.Fixed;

    type FRec5 is record
        f  : PLF.List(5);
    end record;

    type FRec (N : Positive) is record
        f  : PLF.List(N);
    end record;

    lf   : PLF.List(5);
    lfr5 : FRec5;
    lfr  : FRec(5);

begin
    lf(1) := 1;
    lfr5.f(1) := 1;  -- this is still fine
    lfr.f(1)  := 1;  -- this triggers the bug
end bug_03_minimal;
