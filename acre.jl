function acre!(jj::Int64, input::SparseVector{Int64}, fock::SparseVector{Int64})

    # creation operator, a_{jj}^{\dagger}

    # fock is a fock state, a vector having integers
    # its last element is square of coefficient
    fock .= input
    focksize = length(fock)

    fock[jj] = fock[jj]+1
    fock[focksize] = fock[focksize]*fock[jj]

    # return fock

end
