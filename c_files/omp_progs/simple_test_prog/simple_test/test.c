#include <stdio.h>
#include <stdbool.h>
#include <omp.h>

// simple test program with the lscpu output in here

/**
 * lscpu output
Architecture:                x86_64
  CPU op-mode(s):            32-bit, 64-bit
  Address sizes:             39 bits physical, 48 bits virtual
  Byte Order:                Little Endian
CPU(s):                      6
  On-line CPU(s) list:       0-5
Vendor ID:                   GenuineIntel
  Model name:                Intel(R) Core(TM) i5-8500 CPU @ 3.00GHz
    CPU family:              6
    Model:                   158
    Thread(s) per core:      1
    Core(s) per socket:      6
    Socket(s):               1
    Stepping:                10
    CPU(s) scaling MHz:      20%
    CPU max MHz:             4100.0000
    CPU min MHz:             800.0000
    BogoMIPS:                6000.00
    Flags:                   fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 
                             clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx pdpe1gb rdtsc
                             p lm constant_tsc art arch_perfmon pebs bts rep_good nopl xtopology nons
                             top_tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx smx est
                              tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic movbe popcn
                             t tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm abm 3dnowprefetch
                              cpuid_fault epb pti ssbd ibrs ibpb stibp tpr_shadow flexpriority ept vp
                             id ept_ad fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid mpx rdsee
                             d adx smap clflushopt intel_pt xsaveopt xsavec xgetbv1 xsaves dtherm ida
                              arat pln pts hwp hwp_notify hwp_act_window hwp_epp vnmi md_clear flush_
                             l1d arch_capabilities
Virtualization features:     
  Virtualization:            VT-x
Caches (sum of all):         
  L1d:                       192 KiB (6 instances)
  L1i:                       192 KiB (6 instances)
  L2:                        1.5 MiB (6 instances)
  L3:                        9 MiB (1 instance)
NUMA:                        
  NUMA node(s):              1
  NUMA node0 CPU(s):         0-5
Vulnerabilities:             
  Gather data sampling:      Mitigation; Microcode
  Indirect target selection: Not affected
  Itlb multihit:             KVM: Mitigation: Split huge pages
  L1tf:                      Mitigation; PTE Inversion; VMX conditional cache flushes, SMT disabled
  Mds:                       Mitigation; Clear CPU buffers; SMT disabled
  Meltdown:                  Mitigation; PTI
  Mmio stale data:           Mitigation; Clear CPU buffers; SMT disabled
  Reg file data sampling:    Not affected
  Retbleed:                  Mitigation; IBRS
  Spec rstack overflow:      Not affected
  Spec store bypass:         Mitigation; Speculative Store Bypass disabled via prctl
  Spectre v1:                Mitigation; usercopy/swapgs barriers and __user pointer sanitization
  Spectre v2:                Mitigation; IBRS; IBPB conditional; STIBP disabled; RSB filling; PBRSB-e
                             IBRS Not affected; BHI Not affected
  Srbds:                     Mitigation; Microcode
  Tsa:                       Not affected
  Tsx async abort:           Mitigation; TSX disabled
  Vmscape:                   Mitigation; IBPB before exit to userspace
 */
int main() {
    omp_set_num_threads(5);
    #pragma omp parallel
    {
        // Each thread will print this
        printf("Hello from thread %d of %d\n", omp_get_thread_num(), omp_get_num_threads());
    }
    return 0;
}


// int main() {
//     omp_set_num_threads(4);
//     #pragma omp parallel
//     {       
//         int ID = omp_get_thread_num();
//         printf("hello %d\n", ID);
//         printf(" world %d\n", ID);
//     }
//     printf("hello world\n");
// }