generic
    type Real is digits <>;
package root is 

    type Base_Interface is limited interface; 

    procedure Primitive1 (B : in out Base_Interface) is abstract; --  builds
    procedure Primitive2 (B : in out Base_Interface) is null;     --  causes bug

    type Derived_Interface is limited interface and Base_Interface; 

    
    ----------------------------------------------------------
    -- derivations that used to be in child package.
    -- If they are in the same package, the build proceeds fine
    type Base_Type is abstract new Base_Interface with null record;
    
    type Derived_Type is abstract new Base_Type and Derived_Interface with null record;
    

end root;

