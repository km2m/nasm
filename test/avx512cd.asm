; AVX-512CD testcases from gas
;------------------------
;
; This file is taken from there
;     https://gnu.googlesource.com/binutils/+/master/gas/testsuite/gas/i386/x86-64-avx512cd-intel.d
; So the original author is "H.J. Lu" <hongjiu dot lu at intel dot com>
;
; Jin Kyu Song converted it for the nasm testing suite using gas2nasm.py

%macro testcase 2
 %ifdef BIN
  db %1
 %endif
 %ifdef SRC
  %2
 %endif
%endmacro


bits 64

testcase	{ 0x62, 0x02, 0x7d, 0x48, 0xc4, 0xf5                                     }, { vpconflictd zmm30,zmm29                                      }
testcase	{ 0x62, 0x02, 0x7d, 0x4f, 0xc4, 0xf5                                     }, { vpconflictd zmm30\{k7\},zmm29                                }
testcase	{ 0x62, 0x02, 0x7d, 0xcf, 0xc4, 0xf5                                     }, { vpconflictd zmm30\{k7\}\{z\},zmm29                           }
testcase	{ 0x62, 0x62, 0x7d, 0x48, 0xc4, 0x31                                     }, { vpconflictd zmm30,ZWORD [rcx]                                }
testcase	{ 0x62, 0x22, 0x7d, 0x48, 0xc4, 0xb4, 0xf0, 0x23, 0x01, 0x00, 0x00       }, { vpconflictd zmm30,ZWORD [rax+r14*8+0x123]                    }
testcase	{ 0x62, 0x62, 0x7d, 0x58, 0xc4, 0x31                                     }, { vpconflictd zmm30,DWORD [rcx]\{1to16\}                       }
testcase	{ 0x62, 0x62, 0x7d, 0x48, 0xc4, 0x72, 0x7f                               }, { vpconflictd zmm30,ZWORD [rdx+0x1fc0]                         }
testcase	{ 0x62, 0x62, 0x7d, 0x48, 0xc4, 0xb2, 0x00, 0x20, 0x00, 0x00             }, { vpconflictd zmm30,ZWORD [rdx+0x2000]                         }
testcase	{ 0x62, 0x62, 0x7d, 0x48, 0xc4, 0x72, 0x80                               }, { vpconflictd zmm30,ZWORD [rdx-0x2000]                         }
testcase	{ 0x62, 0x62, 0x7d, 0x48, 0xc4, 0xb2, 0xc0, 0xdf, 0xff, 0xff             }, { vpconflictd zmm30,ZWORD [rdx-0x2040]                         }
testcase	{ 0x62, 0x62, 0x7d, 0x58, 0xc4, 0x72, 0x7f                               }, { vpconflictd zmm30,DWORD [rdx+0x1fc]\{1to16\}                 }
testcase	{ 0x62, 0x62, 0x7d, 0x58, 0xc4, 0xb2, 0x00, 0x02, 0x00, 0x00             }, { vpconflictd zmm30,DWORD [rdx+0x200]\{1to16\}                 }
testcase	{ 0x62, 0x62, 0x7d, 0x58, 0xc4, 0x72, 0x80                               }, { vpconflictd zmm30,DWORD [rdx-0x200]\{1to16\}                 }
testcase	{ 0x62, 0x62, 0x7d, 0x58, 0xc4, 0xb2, 0xfc, 0xfd, 0xff, 0xff             }, { vpconflictd zmm30,DWORD [rdx-0x204]\{1to16\}                 }
testcase	{ 0x62, 0x02, 0xfd, 0x48, 0xc4, 0xf5                                     }, { vpconflictq zmm30,zmm29                                      }
testcase	{ 0x62, 0x02, 0xfd, 0x4f, 0xc4, 0xf5                                     }, { vpconflictq zmm30\{k7\},zmm29                                }
testcase	{ 0x62, 0x02, 0xfd, 0xcf, 0xc4, 0xf5                                     }, { vpconflictq zmm30\{k7\}\{z\},zmm29                           }
testcase	{ 0x62, 0x62, 0xfd, 0x48, 0xc4, 0x31                                     }, { vpconflictq zmm30,ZWORD [rcx]                                }
testcase	{ 0x62, 0x22, 0xfd, 0x48, 0xc4, 0xb4, 0xf0, 0x23, 0x01, 0x00, 0x00       }, { vpconflictq zmm30,ZWORD [rax+r14*8+0x123]                    }
testcase	{ 0x62, 0x62, 0xfd, 0x58, 0xc4, 0x31                                     }, { vpconflictq zmm30,QWORD [rcx]\{1to8\}                        }
testcase	{ 0x62, 0x62, 0xfd, 0x48, 0xc4, 0x72, 0x7f                               }, { vpconflictq zmm30,ZWORD [rdx+0x1fc0]                         }
testcase	{ 0x62, 0x62, 0xfd, 0x48, 0xc4, 0xb2, 0x00, 0x20, 0x00, 0x00             }, { vpconflictq zmm30,ZWORD [rdx+0x2000]                         }
testcase	{ 0x62, 0x62, 0xfd, 0x48, 0xc4, 0x72, 0x80                               }, { vpconflictq zmm30,ZWORD [rdx-0x2000]                         }
testcase	{ 0x62, 0x62, 0xfd, 0x48, 0xc4, 0xb2, 0xc0, 0xdf, 0xff, 0xff             }, { vpconflictq zmm30,ZWORD [rdx-0x2040]                         }
testcase	{ 0x62, 0x62, 0xfd, 0x58, 0xc4, 0x72, 0x7f                               }, { vpconflictq zmm30,QWORD [rdx+0x3f8]\{1to8\}                  }
testcase	{ 0x62, 0x62, 0xfd, 0x58, 0xc4, 0xb2, 0x00, 0x04, 0x00, 0x00             }, { vpconflictq zmm30,QWORD [rdx+0x400]\{1to8\}                  }
testcase	{ 0x62, 0x62, 0xfd, 0x58, 0xc4, 0x72, 0x80                               }, { vpconflictq zmm30,QWORD [rdx-0x400]\{1to8\}                  }
testcase	{ 0x62, 0x62, 0xfd, 0x58, 0xc4, 0xb2, 0xf8, 0xfb, 0xff, 0xff             }, { vpconflictq zmm30,QWORD [rdx-0x408]\{1to8\}                  }
testcase	{ 0x62, 0x02, 0x7d, 0x48, 0x44, 0xf5                                     }, { vplzcntd zmm30,zmm29                                         }
testcase	{ 0x62, 0x02, 0x7d, 0x4f, 0x44, 0xf5                                     }, { vplzcntd zmm30\{k7\},zmm29                                   }
testcase	{ 0x62, 0x02, 0x7d, 0xcf, 0x44, 0xf5                                     }, { vplzcntd zmm30\{k7\}\{z\},zmm29                              }
testcase	{ 0x62, 0x62, 0x7d, 0x48, 0x44, 0x31                                     }, { vplzcntd zmm30,ZWORD [rcx]                                   }
testcase	{ 0x62, 0x22, 0x7d, 0x48, 0x44, 0xb4, 0xf0, 0x23, 0x01, 0x00, 0x00       }, { vplzcntd zmm30,ZWORD [rax+r14*8+0x123]                       }
testcase	{ 0x62, 0x62, 0x7d, 0x58, 0x44, 0x31                                     }, { vplzcntd zmm30,DWORD [rcx]\{1to16\}                          }
testcase	{ 0x62, 0x62, 0x7d, 0x48, 0x44, 0x72, 0x7f                               }, { vplzcntd zmm30,ZWORD [rdx+0x1fc0]                            }
testcase	{ 0x62, 0x62, 0x7d, 0x48, 0x44, 0xb2, 0x00, 0x20, 0x00, 0x00             }, { vplzcntd zmm30,ZWORD [rdx+0x2000]                            }
testcase	{ 0x62, 0x62, 0x7d, 0x48, 0x44, 0x72, 0x80                               }, { vplzcntd zmm30,ZWORD [rdx-0x2000]                            }
testcase	{ 0x62, 0x62, 0x7d, 0x48, 0x44, 0xb2, 0xc0, 0xdf, 0xff, 0xff             }, { vplzcntd zmm30,ZWORD [rdx-0x2040]                            }
testcase	{ 0x62, 0x62, 0x7d, 0x58, 0x44, 0x72, 0x7f                               }, { vplzcntd zmm30,DWORD [rdx+0x1fc]\{1to16\}                    }
testcase	{ 0x62, 0x62, 0x7d, 0x58, 0x44, 0xb2, 0x00, 0x02, 0x00, 0x00             }, { vplzcntd zmm30,DWORD [rdx+0x200]\{1to16\}                    }
testcase	{ 0x62, 0x62, 0x7d, 0x58, 0x44, 0x72, 0x80                               }, { vplzcntd zmm30,DWORD [rdx-0x200]\{1to16\}                    }
testcase	{ 0x62, 0x62, 0x7d, 0x58, 0x44, 0xb2, 0xfc, 0xfd, 0xff, 0xff             }, { vplzcntd zmm30,DWORD [rdx-0x204]\{1to16\}                    }
testcase	{ 0x62, 0x02, 0xfd, 0x48, 0x44, 0xf5                                     }, { vplzcntq zmm30,zmm29                                         }
testcase	{ 0x62, 0x02, 0xfd, 0x4f, 0x44, 0xf5                                     }, { vplzcntq zmm30\{k7\},zmm29                                   }
testcase	{ 0x62, 0x02, 0xfd, 0xcf, 0x44, 0xf5                                     }, { vplzcntq zmm30\{k7\}\{z\},zmm29                              }
testcase	{ 0x62, 0x62, 0xfd, 0x48, 0x44, 0x31                                     }, { vplzcntq zmm30,ZWORD [rcx]                                   }
testcase	{ 0x62, 0x22, 0xfd, 0x48, 0x44, 0xb4, 0xf0, 0x23, 0x01, 0x00, 0x00       }, { vplzcntq zmm30,ZWORD [rax+r14*8+0x123]                       }
testcase	{ 0x62, 0x62, 0xfd, 0x58, 0x44, 0x31                                     }, { vplzcntq zmm30,QWORD [rcx]\{1to8\}                           }
testcase	{ 0x62, 0x62, 0xfd, 0x48, 0x44, 0x72, 0x7f                               }, { vplzcntq zmm30,ZWORD [rdx+0x1fc0]                            }
testcase	{ 0x62, 0x62, 0xfd, 0x48, 0x44, 0xb2, 0x00, 0x20, 0x00, 0x00             }, { vplzcntq zmm30,ZWORD [rdx+0x2000]                            }
testcase	{ 0x62, 0x62, 0xfd, 0x48, 0x44, 0x72, 0x80                               }, { vplzcntq zmm30,ZWORD [rdx-0x2000]                            }
testcase	{ 0x62, 0x62, 0xfd, 0x48, 0x44, 0xb2, 0xc0, 0xdf, 0xff, 0xff             }, { vplzcntq zmm30,ZWORD [rdx-0x2040]                            }
testcase	{ 0x62, 0x62, 0xfd, 0x58, 0x44, 0x72, 0x7f                               }, { vplzcntq zmm30,QWORD [rdx+0x3f8]\{1to8\}                     }
testcase	{ 0x62, 0x62, 0xfd, 0x58, 0x44, 0xb2, 0x00, 0x04, 0x00, 0x00             }, { vplzcntq zmm30,QWORD [rdx+0x400]\{1to8\}                     }
testcase	{ 0x62, 0x62, 0xfd, 0x58, 0x44, 0x72, 0x80                               }, { vplzcntq zmm30,QWORD [rdx-0x400]\{1to8\}                     }
testcase	{ 0x62, 0x62, 0xfd, 0x58, 0x44, 0xb2, 0xf8, 0xfb, 0xff, 0xff             }, { vplzcntq zmm30,QWORD [rdx-0x408]\{1to8\}                     }
testcase	{ 0x62, 0x92, 0x16, 0x40, 0x27, 0xec                                     }, { vptestnmd k5,zmm29,zmm28                                     }
testcase	{ 0x62, 0x92, 0x16, 0x47, 0x27, 0xec                                     }, { vptestnmd k5\{k7\},zmm29,zmm28                               }
testcase	{ 0x62, 0xf2, 0x16, 0x40, 0x27, 0x29                                     }, { vptestnmd k5,zmm29,ZWORD [rcx]                               }
testcase	{ 0x62, 0xb2, 0x16, 0x40, 0x27, 0xac, 0xf0, 0x23, 0x01, 0x00, 0x00       }, { vptestnmd k5,zmm29,ZWORD [rax+r14*8+0x123]                   }
testcase	{ 0x62, 0xf2, 0x16, 0x50, 0x27, 0x29                                     }, { vptestnmd k5,zmm29,DWORD [rcx]\{1to16\}                      }
testcase	{ 0x62, 0xf2, 0x16, 0x40, 0x27, 0x6a, 0x7f                               }, { vptestnmd k5,zmm29,ZWORD [rdx+0x1fc0]                        }
testcase	{ 0x62, 0xf2, 0x16, 0x40, 0x27, 0xaa, 0x00, 0x20, 0x00, 0x00             }, { vptestnmd k5,zmm29,ZWORD [rdx+0x2000]                        }
testcase	{ 0x62, 0xf2, 0x16, 0x40, 0x27, 0x6a, 0x80                               }, { vptestnmd k5,zmm29,ZWORD [rdx-0x2000]                        }
testcase	{ 0x62, 0xf2, 0x16, 0x40, 0x27, 0xaa, 0xc0, 0xdf, 0xff, 0xff             }, { vptestnmd k5,zmm29,ZWORD [rdx-0x2040]                        }
testcase	{ 0x62, 0xf2, 0x16, 0x50, 0x27, 0x6a, 0x7f                               }, { vptestnmd k5,zmm29,DWORD [rdx+0x1fc]\{1to16\}                }
testcase	{ 0x62, 0xf2, 0x16, 0x50, 0x27, 0xaa, 0x00, 0x02, 0x00, 0x00             }, { vptestnmd k5,zmm29,DWORD [rdx+0x200]\{1to16\}                }
testcase	{ 0x62, 0xf2, 0x16, 0x50, 0x27, 0x6a, 0x80                               }, { vptestnmd k5,zmm29,DWORD [rdx-0x200]\{1to16\}                }
testcase	{ 0x62, 0xf2, 0x16, 0x50, 0x27, 0xaa, 0xfc, 0xfd, 0xff, 0xff             }, { vptestnmd k5,zmm29,DWORD [rdx-0x204]\{1to16\}                }
testcase	{ 0x62, 0x92, 0x96, 0x40, 0x27, 0xec                                     }, { vptestnmq k5,zmm29,zmm28                                     }
testcase	{ 0x62, 0x92, 0x96, 0x47, 0x27, 0xec                                     }, { vptestnmq k5\{k7\},zmm29,zmm28                               }
testcase	{ 0x62, 0xf2, 0x96, 0x40, 0x27, 0x29                                     }, { vptestnmq k5,zmm29,ZWORD [rcx]                               }
testcase	{ 0x62, 0xb2, 0x96, 0x40, 0x27, 0xac, 0xf0, 0x23, 0x01, 0x00, 0x00       }, { vptestnmq k5,zmm29,ZWORD [rax+r14*8+0x123]                   }
testcase	{ 0x62, 0xf2, 0x96, 0x50, 0x27, 0x29                                     }, { vptestnmq k5,zmm29,QWORD [rcx]\{1to8\}                       }
testcase	{ 0x62, 0xf2, 0x96, 0x40, 0x27, 0x6a, 0x7f                               }, { vptestnmq k5,zmm29,ZWORD [rdx+0x1fc0]                        }
testcase	{ 0x62, 0xf2, 0x96, 0x40, 0x27, 0xaa, 0x00, 0x20, 0x00, 0x00             }, { vptestnmq k5,zmm29,ZWORD [rdx+0x2000]                        }
testcase	{ 0x62, 0xf2, 0x96, 0x40, 0x27, 0x6a, 0x80                               }, { vptestnmq k5,zmm29,ZWORD [rdx-0x2000]                        }
testcase	{ 0x62, 0xf2, 0x96, 0x40, 0x27, 0xaa, 0xc0, 0xdf, 0xff, 0xff             }, { vptestnmq k5,zmm29,ZWORD [rdx-0x2040]                        }
testcase	{ 0x62, 0xf2, 0x96, 0x50, 0x27, 0x6a, 0x7f                               }, { vptestnmq k5,zmm29,QWORD [rdx+0x3f8]\{1to8\}                 }
testcase	{ 0x62, 0xf2, 0x96, 0x50, 0x27, 0xaa, 0x00, 0x04, 0x00, 0x00             }, { vptestnmq k5,zmm29,QWORD [rdx+0x400]\{1to8\}                 }
testcase	{ 0x62, 0xf2, 0x96, 0x50, 0x27, 0x6a, 0x80                               }, { vptestnmq k5,zmm29,QWORD [rdx-0x400]\{1to8\}                 }
testcase	{ 0x62, 0xf2, 0x96, 0x50, 0x27, 0xaa, 0xf8, 0xfb, 0xff, 0xff             }, { vptestnmq k5,zmm29,QWORD [rdx-0x408]\{1to8\}                 }
testcase	{ 0x62, 0x62, 0x7e, 0x48, 0x3a, 0xf6                                     }, { vpbroadcastmw2d zmm30,k6                                     }
testcase	{ 0x62, 0x62, 0xfe, 0x48, 0x2a, 0xf6                                     }, { vpbroadcastmb2q zmm30,k6                                     }
