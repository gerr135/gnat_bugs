generic
package root.child1.child2 is
    
    type Base_Type is abstract new Base_Interface with null record;
    
    type Derived_Type is abstract new Base_Type and Derived_Interface with null record;
    
end root.child1.child2; 
