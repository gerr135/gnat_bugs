with Ada.Containers.Vectors;

generic
package Lists.dynamic is

    type List is new List_Interface with private;

    overriding
    function List_Constant_Reference (Container : aliased in List; Position  : Cursor) return Constant_Reference_Type;

    overriding
    function List_Constant_Reference (Container : aliased in List; Index : Index_Type) return Constant_Reference_Type;

    overriding
    function List_Reference (Container : aliased in out List; Position  : Cursor) return Reference_Type;

    overriding
    function List_Reference (Container : aliased in out List; Index : Index_Type) return Reference_Type;

    overriding
    function Iterate (Container : in List) return Iterator_Interface'Class;

    -- new methods from ACV.Vector pool; should really be part of interface, here is only a demo of tying all together..
    function To_Vector (Length : Index_Type) return List;

private

    package ACV is new Ada.Containers.Vectors(Index_Type, Element_Type);

    type List is new List_Interface with record
        vec : ACV.Vector;
    end record;

end Lists.dynamic;
