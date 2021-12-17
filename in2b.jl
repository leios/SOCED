function in2b(indfk::Int,Msize::Int,Np::Int)

    # this function return the index of Fock state at the index of many body state

    include("pascaltriangle.jl") # define pascaltriangle(m,n)
    matp = pascaltriangle(Msize,Np) # the size is Msize+1 times Np+1
    # note the indices are m+1 and n+1 for N^m_n

    # unlike Ponomarev's way, I count the index of Fock state in the backwards
    # so that "1" means |Np,0,0,...>.
    indfk = matp[Msize+1,Np+1] + 1 - indfk # the indices are m+1 and n+1 for N^m_n

    if indfk > matp[Msize+1,Np+1] # the indices are m+1 and n+1 for N^m_n
       error("indfk larger than the maximum of N^M_N.")
    end

    indfk = indfk - 1
    vecmb = zeros(Int,Msize+1)

    indM = Msize-1
    indN = Np

    while true

          if indN == 0
             break
          end

          if indfk >= matp[indM+1,indN+1]
             indfk = indfk - matp[indM+1,indN+1] # the indices are m+1 and n+1 for N^m_n
             vecmb[Msize-indM] = vecmb[Msize-indM] + 1
             indN = indN - 1
          else
             indM = indM - 1
          end

    end

    # the last element for the coefficient
    vecmb[Msize+1] = 1

    return vecmb

end
