ctypedef long long MKL_INT64
ctypedef unsigned long long MKL_UINT64
ctypedef int MKL_INT


cdef extern from "mkl.h":
    # MKL_INT64 mkl_peak_mem_usage(int mode)
    # In
    int MKL_PEAK_MEM_ENABLE
    int MKL_PEAK_MEM_DISABLE
    int MKL_PEAK_MEM
    int MKL_PEAK_MEM_RESET

    # int mkl_set_memory_limit(int mem_type, size_t limit)
    # In
    int MKL_MEM_MCDRAM

    # int mkl_cbwr_set(int settings)
    # In
    int MKL_CBWR_AUTO
    int MKL_CBWR_COMPATIBLE
    int MKL_CBWR_SSE2
    int MKL_CBWR_SSE3
    int MKL_CBWR_SSSE3
    int MKL_CBWR_SSE4_1
    int MKL_CBWR_SSE4_2
    int MKL_CBWR_AVX
    int MKL_CBWR_AVX2
    int MKL_CBWR_AVX512_MIC
    int MKL_CBWR_AVX512
    # Out
    int MKL_CBWR_SUCCESS
    int MKL_CBWR_ERR_INVALID_INPUT
    int MKL_CBWR_ERR_UNSUPPORTED_BRANCH
    int MKL_CBWR_ERR_MODE_CHANGE_FAILURE

    # int mkl_enable_instructions(int isa)
    # In
    int MKL_ENABLE_AVX512
    int MKL_ENABLE_AVX512_MIC
    int MKL_ENABLE_AVX2
    int MKL_ENABLE_AVX
    int MKL_ENABLE_SSE4_2

    # unsigned int vmlSetMode(unsigned int mode)
    # In
    int VML_HA
    int VML_LA
    int VML_EP
    int VML_FTZDAZ_ON
    int VML_FTZDAZ_OFF
    int VML_ERRMODE_IGNORE
    int VML_ERRMODE_ERRNO
    int VML_ERRMODE_STDERR
    int VML_ERRMODE_EXCEPT
    int VML_ERRMODE_CALLBACK
    int VML_ERRMODE_DEFAULT

    # int vmlSetErrStatus(const MKL_INT status)
    # In
    int VML_STATUS_OK
    int VML_STATUS_ACCURACYWARNING
    int VML_STATUS_BADSIZE
    int VML_STATUS_BADMEM
    int VML_STATUS_ERRDOM
    int VML_STATUS_SING
    int VML_STATUS_OVERFLOW
    int VML_STATUS_UNDERFLOW


    ctypedef struct MKLVersion:
        int MajorVersion
        int MinorVersion
        int UpdateVersion
        char* ProductStatus
        char* Build
        char* Processor
        char* Platform

    # MKL support functions
    void mkl_get_version(MKLVersion *pv)
    void mkl_get_version_string(char *buf, int len)

    # Threading
    void mkl_set_num_threads(int nth)
    int mkl_domain_set_num_threads(int nt, int domain)
    int mkl_set_num_threads_local(int nth)
    void mkl_set_dynamic(int flag)
    int mkl_get_max_threads()
    int mkl_domain_get_max_threads(int domain)
    int mkl_get_dynamic()

    # Timing
    float second()
    double dsecnd()
    void mkl_get_cpu_clocks(MKL_UINT64 *clocks)
    double mkl_get_cpu_frequency()
    double mkl_get_max_cpu_frequency()
    double mkl_get_clocks_frequency()

    # Memory
    void mkl_free_buffers()
    void mkl_thread_free_buffers()
    int mkl_disable_fast_mm()
    MKL_INT64 mkl_mem_stat(int *buf)
    MKL_INT64 mkl_peak_mem_usage(int mode)
    int mkl_set_memory_limit(int mem_type, size_t limit)

    # Conditional Numerical Reproducibility
    int mkl_cbwr_set(int settings)
    int mkl_cbwr_get_auto_branch()

    # Miscellaneous
    int mkl_enable_instructions(int isa)
    int mkl_set_env_mode(int mode)
    int mkl_verbose(int enable)
    int mkl_set_mpi (int vendor, const char *custom_library_name)

    # VM Service Functions
    unsigned int vmlSetMode(unsigned int mode)
    unsigned int vmlGetMode()
    int vmlSetErrStatus(const MKL_INT status)
    int vmlGetErrStatus()
    int vmlClearErrStatus()

