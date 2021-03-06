module NMRTools

using Colors
using DimensionalData
using LsqFit
using Measurements
using OffsetArrays
using Optim
using Plots
using SimpleTraits
using SpecialFunctions
using Statistics

import Base.getindex, Base.setindex!
import DimensionalData.dims, DimensionalData.refdims, DimensionalData.data, DimensionalData.name, DimensionalData.metadata, DimensionalData.label, DimensionalData.rebuild
import DimensionalData.X, DimensionalData.Y, DimensionalData.Z, DimensionalData.Ti
import DimensionalData.Between, DimensionalData.At, DimensionalData.Near

export NMRData
export dims, X, Y, Z, Ti
export xval, yval, zval, tval, settval
export At, Near, Between
export haspseudodimension, HasPseudoDimension
export NMRToolsException
export loadnmr
export data, acqus, label, label!, metadata, metadatahelp, scale
export WindowFunction, NullWindow, UnknownWindow, ExponentialWindow, SineWindow, GaussWindow
export GeneralSineWindow, CosWindow, Cos²Window, GeneralGaussWindow, LorentzToGaussWindow
export estimatenoise!
export fitexp, fitdiffusion

# type definitions
include("util.jl")
include("exceptions.jl")
include("nmrdata.jl")
include("windows.jl")

# routines
include("noise.jl")
include("loadnmr.jl")
include("plotrecipes.jl")
include("fittingpseudo2d.jl")

end # module
