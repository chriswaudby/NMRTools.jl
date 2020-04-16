module NMRTools

using Lazy
using Reexport
using SimpleTraits
using OffsetArrays
using DimensionalData

import Base.getindex
import DimensionalData.refdims, DimensionalData.data, DimensionalData.name, DimensionalData.metadata, DimensionalData.label, DimensionalData.rebuild
import DimensionalData.X, DimensionalData.Y, DimensionalData.Z, DimensionalData.Ti

export NMRData
export X, Y, Z, Ti
export haspseudodimension, HasPseudoDimension
export NMRToolsException
export loadnmr
export metadata, metadatahelp
export WindowFunction, NullWindow, UnknownWindow, ExponentialWindow, SineWindow, GaussWindow

# type definitions
include("exceptions.jl")
include("nmrdata.jl")
include("windows.jl")

# routines
include("loadnmr.jl")

end # module
