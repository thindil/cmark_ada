pragma Style_Checks(Off);

with bits_types_struct_FILE_h;

package bits_types_FILE_h is

   -- The opaque type of streams.  This is the definition used elsewhere.
   subtype FILE is
     bits_types_struct_FILE_h.u_IO_FILE;  -- /usr/include/bits/types/FILE.h:7

end bits_types_FILE_h;
