MRuby::Build.new do |conf|
  # load specific toolchain settings

  # Gets set by the VS command prompts.
  if ENV['VisualStudioVersion'] || ENV['VSINSTALLDIR']
    toolchain :visualcpp
  else
    toolchain :gcc
  end

  # Turn on `enable_debug` for better debugging
  # enable_debug

  # Use mrbgems
  # conf.gem 'examples/mrbgems/ruby_extension_example'
  # conf.gem 'examples/mrbgems/c_extension_example' do |g|
  #   g.cc.flags << '-g' # append cflags in this gem
  # end
  # conf.gem 'examples/mrbgems/c_and_ruby_extension_example'
  # conf.gem :core => 'mruby-eval'
  # conf.gem :mgem => 'mruby-io'
  # conf.gem :github => 'iij/mruby-io'
  # conf.gem :git => 'git@github.com:iij/mruby-io.git', :branch => 'master', :options => '-v'

  # include the default GEMs
  conf.gembox 'default'

  # Use standard Array#pack, String#unpack methods
  conf.gem :core => "mruby-pack"

  # Use standard Kernel#sprintf method
  conf.gem :core => "mruby-sprintf"

  # Use standard print/puts/p
  conf.gem :core => "mruby-print"

  # Use standard Math module
  conf.gem :core => "mruby-math"

  # Use standard Time class
  conf.gem :core => "mruby-time"

  # Use standard Struct class
  conf.gem :core => "mruby-struct"

  # Use Comparable module extension
  conf.gem :core => "mruby-compar-ext"

  # Use Enumerable module extension
  conf.gem :core => "mruby-enum-ext"

  # Use String class extension
  conf.gem :core => "mruby-string-ext"

  # Use Numeric class extension
  conf.gem :core => "mruby-numeric-ext"

  # Use Array class extension
  conf.gem :core => "mruby-array-ext"

  # Use Hash class extension
  conf.gem :core => "mruby-hash-ext"

  # Use Range class extension
  conf.gem :core => "mruby-range-ext"

  # Use Proc class extension
  conf.gem :core => "mruby-proc-ext"

  # Use Symbol class extension
  conf.gem :core => "mruby-symbol-ext"

  # Use Random class
  conf.gem :core => "mruby-random"

  # Use Object class extension
  conf.gem :core => "mruby-object-ext"

  # Use ObjectSpace class
  conf.gem :core => "mruby-objectspace"

  # Use Fiber class
  conf.gem :core => "mruby-fiber"

  # Use Enumerator class (require mruby-fiber)
  conf.gem :core => "mruby-enumerator"

  # Use Enumerator::Lazy class (require mruby-enumerator)
  conf.gem :core => "mruby-enum-lazy"

  # Use toplevel object (main) methods extension
  conf.gem :core => "mruby-toplevel-ext"

  # Generate mirb command
  conf.gem :core => "mruby-bin-mirb"

  # Generate mruby command
  conf.gem :core => "mruby-bin-mruby"

  # Generate mruby-strip command
  conf.gem :core => "mruby-bin-strip"

  # Use Kernel module extension
  conf.gem :core => "mruby-kernel-ext"

  # Use class/module extension
  conf.gem :core => "mruby-class-ext"

  # Use mruby-compiler to build other mrbgems
  conf.gem :core => "mruby-compiler"

  # C compiler settings
  # conf.cc do |cc|
  #   cc.command = ENV['CC'] || 'gcc'
  #   cc.flags = [ENV['CFLAGS'] || %w()]
  #   cc.include_paths = ["#{root}/include"]
  #   cc.defines = %w(DISABLE_GEMS)
  #   cc.option_include_path = '-I%s'
  #   cc.option_define = '-D%s'
  #   cc.compile_options = "%{flags} -MMD -o %{outfile} -c %{infile}"
  # end

  # mrbc settings
  # conf.mrbc do |mrbc|
  #   mrbc.compile_options = "-g -B%{funcname} -o-" # The -g option is required for line numbers
  # end

  # Linker settings
  # conf.linker do |linker|
  #   linker.command = ENV['LD'] || 'gcc'
  #   linker.flags = [ENV['LDFLAGS'] || []]
  #   linker.flags_before_libraries = []
  #   linker.libraries = %w()
  #   linker.flags_after_libraries = []
  #   linker.library_paths = []
  #   linker.option_library = '-l%s'
  #   linker.option_library_path = '-L%s'
  #   linker.link_options = "%{flags} -o %{outfile} %{objs} %{libs}"
  # end

  # Archiver settings
  # conf.archiver do |archiver|
  #   archiver.command = ENV['AR'] || 'ar'
  #   archiver.archive_options = 'rs %{outfile} %{objs}'
  # end

  # Parser generator settings
  # conf.yacc do |yacc|
  #   yacc.command = ENV['YACC'] || 'bison'
  #   yacc.compile_options = '-o %{outfile} %{infile}'
  # end

  # gperf settings
  # conf.gperf do |gperf|
  #   gperf.command = 'gperf'
  #   gperf.compile_options = '-L ANSI-C -C -p -j1 -i 1 -g -o -t -N mrb_reserved_word -k"1,3,$" %{infile} > %{outfile}'
  # end

  # file extensions
  # conf.exts do |exts|
  #   exts.object = '.o'
  #   exts.executable = '' # '.exe' if Windows
  #   exts.library = '.a'
  # end

  # file separetor
  # conf.file_separator = '/'

  # bintest
  # conf.enable_bintest
end

MRuby::Toolchain.new(:riscv) do |conf, _params|
  toolchain :gcc

  [conf.cc, conf.objc, conf.asm].each do |cc|
    cc.command = ENV['CC'] || 'riscv64-unknown-elf-gcc'
  end
  conf.archiver.command = ENV['AR'] || 'riscv64-unknown-elf-ar'
  conf.cxx.command = ENV['CXX'] || 'riscv64-unknown-elf-g++'
  conf.linker.command = ENV['LD'] || 'riscv64-unknown-elf-gcc'
end

MRuby::Build.new('riscv-gcc') do |conf|
  toolchain :riscv

  conf.enable_bintest
  conf.enable_test

  # Use standard Array#pack, String#unpack methods
  conf.gem :core => "mruby-pack"

  # Use standard Kernel#sprintf method
  conf.gem :core => "mruby-sprintf"

  # Use standard print/puts/p
  conf.gem :core => "mruby-print"

  # Use standard Math module
  conf.gem :core => "mruby-math"

  # Use standard Time class
  conf.gem :core => "mruby-time"

  # Use standard Struct class
  conf.gem :core => "mruby-struct"

  # Use Comparable module extension
  conf.gem :core => "mruby-compar-ext"

  # Use Enumerable module extension
  conf.gem :core => "mruby-enum-ext"

  # Use String class extension
  conf.gem :core => "mruby-string-ext"

  # Use Numeric class extension
  conf.gem :core => "mruby-numeric-ext"

  # Use Array class extension
  conf.gem :core => "mruby-array-ext"

  # Use Hash class extension
  conf.gem :core => "mruby-hash-ext"

  # Use Range class extension
  conf.gem :core => "mruby-range-ext"

  # Use Proc class extension
  conf.gem :core => "mruby-proc-ext"

  # Use Symbol class extension
  conf.gem :core => "mruby-symbol-ext"

  # Use Random class
  conf.gem :core => "mruby-random"

  # Use Object class extension
  conf.gem :core => "mruby-object-ext"

  # Use ObjectSpace class
  conf.gem :core => "mruby-objectspace"

  # Use Fiber class
  conf.gem :core => "mruby-fiber"

  # Use Enumerator class (require mruby-fiber)
  conf.gem :core => "mruby-enumerator"

  # Use Enumerator::Lazy class (require mruby-enumerator)
  conf.gem :core => "mruby-enum-lazy"

  # Use toplevel object (main) methods extension
  conf.gem :core => "mruby-toplevel-ext"

  # Generate mirb command
  conf.gem :core => "mruby-bin-mirb"

  # Generate mruby command
  conf.gem :core => "mruby-bin-mruby"

  # Generate mruby-strip command
  conf.gem :core => "mruby-bin-strip"

  # Use Kernel module extension
  conf.gem :core => "mruby-kernel-ext"

  # Use class/module extension
  conf.gem :core => "mruby-class-ext"

  # Use mruby-compiler to build other mrbgems
  conf.gem :core => "mruby-compiler"
end
