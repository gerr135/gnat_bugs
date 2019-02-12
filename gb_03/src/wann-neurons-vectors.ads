--
-- wann.neurons.vectors package. ACV-based implementation, mutable.
--
-- Copyright (C) 2018  <George Shapovalov> <gshapovalov@gmail.com>
--
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU Lesser General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <http://www.gnu.org/licenses/>.
--

with Ada.Containers.Vectors;

generic
package wann.neurons.vectors is

    type Neuron is new Neuron_Interface with private;

    -- inherited primitives
    overriding
    function  ToRepr  (neur : Neuron) return NeuronRepr;
    overriding
    procedure FromRepr(NI : in out Neuron; LR : NeuronRepr);

    not overriding
    function Create(activation : Activation_Type;
                    connections : NN.Input_Connection_Array;
                    maxWeight : Real) return Neuron;


private

    -- needed vector types
    use type NN.ConnectionIndex;
    package IV is new Ada.Containers.Vectors(Index_Type=>InputIndex,  Element_Type=>NN.ConnectionIndex);
    package OV is new Ada.Containers.Vectors(Index_Type=>OutputIndex, Element_Type=>NN.ConnectionIndex);

    type Neuron is new Neuron_Interface with record
        idx     : NN.NeuronIndex_Base; -- own index in NNet
        activat : Activation_Type;
        lag     : Real;    -- delay of result propagation, unused for now
        inputs  : IV.Vector;
        outputs : OV.Vector;
    end record;


end wann.neurons.vectors;
