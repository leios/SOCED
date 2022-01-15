# include("pascaltriangle.jl")
# include("in2b.jl")
# include("b2in.jl")
include("in2bEne2.jl")

function cutMsizeEne2(Msize::Int64, Np::Int64, matp::Matrix{Int64}, Enecutoff::Int64)

    # this function puts the cut-off in the number of states by a given energy

    # Msize = Msize0*2

    # matp = zeros(Int64,Msize+1,Np+1)
    # pascaltriangle!(Msize,Np,matp) # the size is Msize+1 times Np+1
    maxmatp = matp[Msize+1,Np+1] # the indices are m+1 and n+1 for N^m_ns

    indvec = zeros(Int64,maxmatp)
    mm = 0

    for nn = 1:maxmatp

        Enenn = in2bEne2(nn,Msize,Np,matp)

        if Enenn <= Enecutoff
           mm = mm + 1
           indvec[mm] = nn
        end

    end

    indvec1 = copy(indvec[1:mm])

    return indvec1

end
