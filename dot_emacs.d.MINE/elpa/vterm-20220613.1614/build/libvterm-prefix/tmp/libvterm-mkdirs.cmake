# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "/home/luna/.emacs.d/elpa/vterm-20220613.1614/build/libvterm-prefix/src/libvterm"
  "/home/luna/.emacs.d/elpa/vterm-20220613.1614/build/libvterm-prefix/src/libvterm-build"
  "/home/luna/.emacs.d/elpa/vterm-20220613.1614/build/libvterm-prefix"
  "/home/luna/.emacs.d/elpa/vterm-20220613.1614/build/libvterm-prefix/tmp"
  "/home/luna/.emacs.d/elpa/vterm-20220613.1614/build/libvterm-prefix/src/libvterm-stamp"
  "/home/luna/.emacs.d/elpa/vterm-20220613.1614/build/libvterm-prefix/src"
  "/home/luna/.emacs.d/elpa/vterm-20220613.1614/build/libvterm-prefix/src/libvterm-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/home/luna/.emacs.d/elpa/vterm-20220613.1614/build/libvterm-prefix/src/libvterm-stamp/${subDir}")
endforeach()
