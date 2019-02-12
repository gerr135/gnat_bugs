with nnet_types;

generic
    type Real is digits <>;
package wann is

    Debug : Boolean := False;
    --  set this to True to make this lib spit out debug messages (to console)

    ----------------------------
    -- exceptions
    --
    Data_Width_Mismatch : Exception;
    --  trying to pass data of mismatching size between inputs/outputs/next layer

    Unsorted_Net_Propagation : Exception;
    --  trying to propagate through NNet before creating layers

    Unset_Value_Access : Exception;
    --  trying to access a not-yet-set (or already cleared) cached value

    Invalid_Connection : Exception;
    --  trying to make connection that obviously makes no sense
    --  (connect neuron input to net output, etc..)


    ------------------------------------------------------------
    -- Some common types; basic and not requiring special naming
    --
    type Activation_Type is (Sigmoid, ReLu);
    type Activation_Function is access function (x : Real) return Real;
    -- the ready to use functions (activators and derivatives) are defined in wann.functions package

    -- how we move through layers
    type Propagation_Type is
             (Simple, -- cycle through neurons in layer; for basic use and in case of very sparse connections
              Matrix, -- compose a common matrix and do vector algebra; the common case
              GPU);   -- try to do linear algebra in GPU
        -- this will be (most likely) handled through layer types via OOP hierarchy.

    type Sort_Direction is (Forward, Backward);

    package NN is new nnet_types(Real);

    function  Get_Value(SV : NN.State_Vector; idx : NN.ConnectionIndex)
        return Real with Inline;
    --
    procedure Set_Value(SV : in out NN.State_Vector; idx : NN.ConnectionIndex;
                        value : Real) with Inline;
    --
    function Is_Valid(SV : NN.Checked_State_Vector; idx : NN.ConnectionIndex)
        return Boolean with Inline;
    --
    function  Get_Value(SV : NN.Checked_State_Vector; idx : NN.ConnectionIndex)
        return Real with Inline;
    --
    procedure Set_Value(SV : in out NN.Checked_State_Vector; idx : NN.ConnectionIndex;
                        value : Real) with Inline;


end wann;
