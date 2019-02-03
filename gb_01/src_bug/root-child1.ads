generic 
package root.child1 is 

    type Base_Interface is limited interface; 

    procedure Primitive1 (B : in out Base_Interface) is abstract; --  builds
    procedure Primitive2 (B : in out Base_Interface) is null;     --  causes bug

    type Derived_Interface is limited interface and Base_Interface; 
        
end root.child1;

