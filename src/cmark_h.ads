pragma Style_Checks(Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with stddef_h;
with System;
with bits_types_FILE_h;

package cmark_h is

--  unsupported macro: CMARK_NODE_HEADER CMARK_NODE_HEADING
--  unsupported macro: CMARK_NODE_HRULE CMARK_NODE_THEMATIC_BREAK
--  unsupported macro: CMARK_NODE_HTML CMARK_NODE_HTML_BLOCK
--  unsupported macro: CMARK_NODE_INLINE_HTML CMARK_NODE_HTML_INLINE
--  unsupported macro: cmark_node_get_header_level cmark_node_get_heading_level
--  unsupported macro: cmark_node_set_header_level cmark_node_set_heading_level
   CMARK_OPT_DEFAULT: constant := 0;  --  /usr/local/include/cmark.h:541

   CMARK_OPT_SOURCEPOS: constant := (2**1);  --  /usr/local/include/cmark.h:549

   CMARK_OPT_HARDBREAKS: constant :=
     (2**2);  --  /usr/local/include/cmark.h:553

   CMARK_OPT_SAFE: constant := (2**3);  --  /usr/local/include/cmark.h:561

   CMARK_OPT_NOBREAKS: constant := (2**4);  --  /usr/local/include/cmark.h:565

   CMARK_OPT_NORMALIZE: constant := (2**8);  --  /usr/local/include/cmark.h:573

   CMARK_OPT_VALIDATE_UTF8: constant :=
     (2**9);  --  /usr/local/include/cmark.h:578

   CMARK_OPT_SMART: constant := (2**10);  --  /usr/local/include/cmark.h:582
   --  unsupported macro: NODE_DOCUMENT CMARK_NODE_DOCUMENT
   --  unsupported macro: NODE_BLOCK_QUOTE CMARK_NODE_BLOCK_QUOTE
   --  unsupported macro: NODE_LIST CMARK_NODE_LIST
   --  unsupported macro: NODE_ITEM CMARK_NODE_ITEM
   --  unsupported macro: NODE_CODE_BLOCK CMARK_NODE_CODE_BLOCK
   --  unsupported macro: NODE_HTML_BLOCK CMARK_NODE_HTML_BLOCK
   --  unsupported macro: NODE_CUSTOM_BLOCK CMARK_NODE_CUSTOM_BLOCK
   --  unsupported macro: NODE_PARAGRAPH CMARK_NODE_PARAGRAPH
   --  unsupported macro: NODE_HEADING CMARK_NODE_HEADING
   --  unsupported macro: NODE_HEADER CMARK_NODE_HEADER
   --  unsupported macro: NODE_THEMATIC_BREAK CMARK_NODE_THEMATIC_BREAK
   --  unsupported macro: NODE_HRULE CMARK_NODE_HRULE
   --  unsupported macro: NODE_TEXT CMARK_NODE_TEXT
   --  unsupported macro: NODE_SOFTBREAK CMARK_NODE_SOFTBREAK
   --  unsupported macro: NODE_LINEBREAK CMARK_NODE_LINEBREAK
   --  unsupported macro: NODE_CODE CMARK_NODE_CODE
   --  unsupported macro: NODE_HTML_INLINE CMARK_NODE_HTML_INLINE
   --  unsupported macro: NODE_CUSTOM_INLINE CMARK_NODE_CUSTOM_INLINE
   --  unsupported macro: NODE_EMPH CMARK_NODE_EMPH
   --  unsupported macro: NODE_STRONG CMARK_NODE_STRONG
   --  unsupported macro: NODE_LINK CMARK_NODE_LINK
   --  unsupported macro: NODE_IMAGE CMARK_NODE_IMAGE
   --  unsupported macro: BULLET_LIST CMARK_BULLET_LIST
   --  unsupported macro: ORDERED_LIST CMARK_ORDERED_LIST
   --  unsupported macro: PERIOD_DELIM CMARK_PERIOD_DELIM
   --  unsupported macro: PAREN_DELIM CMARK_PAREN_DELIM

  --* # NAME
   -- *
   -- * **cmark** - CommonMark parsing, manipulating, and rendering
   --

  --* # DESCRIPTION
   -- *
   -- * ## Simple Interface
   --

  --* Convert 'text' (assumed to be a UTF-8 encoded string with length
   -- * 'len') from CommonMark Markdown to HTML, returning a null-terminated,
   -- * UTF-8-encoded string. It is the caller's responsibility
   -- * to free the returned buffer.
   --

   function cmark_markdown_to_html(text: Interfaces.C.Strings.chars_ptr;
      len: stddef_h.size_t;
      options: int) return Interfaces.C.Strings
     .chars_ptr;  -- /usr/local/include/cmark.h:28
   pragma Import(C, cmark_markdown_to_html, "cmark_markdown_to_html");

  --* ## Node Structure
   --

   -- Error status
   -- Block
   -- Inline
   subtype cmark_node_type is unsigned;
   CMARK_NODE_NONE: constant unsigned := 0;
   CMARK_NODE_DOCUMENT: constant unsigned := 1;
   CMARK_NODE_BLOCK_QUOTE: constant unsigned := 2;
   CMARK_NODE_LIST: constant unsigned := 3;
   CMARK_NODE_ITEM: constant unsigned := 4;
   CMARK_NODE_CODE_BLOCK: constant unsigned := 5;
   CMARK_NODE_HTML_BLOCK: constant unsigned := 6;
   CMARK_NODE_CUSTOM_BLOCK: constant unsigned := 7;
   CMARK_NODE_PARAGRAPH: constant unsigned := 8;
   CMARK_NODE_HEADING: constant unsigned := 9;
   CMARK_NODE_THEMATIC_BREAK: constant unsigned := 10;
   CMARK_NODE_FIRST_BLOCK: constant unsigned := 1;
   CMARK_NODE_LAST_BLOCK: constant unsigned := 10;
   CMARK_NODE_TEXT: constant unsigned := 11;
   CMARK_NODE_SOFTBREAK: constant unsigned := 12;
   CMARK_NODE_LINEBREAK: constant unsigned := 13;
   CMARK_NODE_CODE: constant unsigned := 14;
   CMARK_NODE_HTML_INLINE: constant unsigned := 15;
   CMARK_NODE_CUSTOM_INLINE: constant unsigned := 16;
   CMARK_NODE_EMPH: constant unsigned := 17;
   CMARK_NODE_STRONG: constant unsigned := 18;
   CMARK_NODE_LINK: constant unsigned := 19;
   CMARK_NODE_IMAGE: constant unsigned := 20;
   CMARK_NODE_FIRST_INLINE: constant unsigned := 11;
   CMARK_NODE_LAST_INLINE: constant unsigned :=
     20;  -- /usr/local/include/cmark.h:66

   -- For backwards compatibility:
   type cmark_list_type is
     (CMARK_NO_LIST, CMARK_BULLET_LIST, CMARK_ORDERED_LIST);
   pragma Convention(C, cmark_list_type);  -- /usr/local/include/cmark.h:78

   type cmark_delim_type is
     (CMARK_NO_DELIM, CMARK_PERIOD_DELIM, CMARK_PAREN_DELIM);
   pragma Convention(C, cmark_delim_type);  -- /usr/local/include/cmark.h:84

   type cmark_node is null record;   -- incomplete struct

   type cmark_parser is null record;   -- incomplete struct

   type cmark_iter is null record;   -- incomplete struct

  --*
   -- * ## Custom memory allocator support
   --

  --* Defines the memory allocation functions to be used by CMark
   -- * when parsing and allocating a document tree
   --

   type cmark_mem is record
      calloc: access function(arg1: stddef_h.size_t;
         arg2: stddef_h.size_t) return System
        .Address;  -- /usr/local/include/cmark.h:98
      realloc: access function(arg1: System.Address;
         arg2: stddef_h.size_t) return System
        .Address;  -- /usr/local/include/cmark.h:99
      free: access procedure
        (arg1: System.Address);  -- /usr/local/include/cmark.h:100
   end record;
   pragma Convention(C_Pass_By_Copy,
      cmark_mem);  -- /usr/local/include/cmark.h:97

  --*
   -- * ## Creating and Destroying Nodes
   --

  --* Creates a new node of type 'type'.  Note that the node may have
   -- * other required properties, which it is the caller's responsibility
   -- * to assign.
   --

   function cmark_node_new
     (c_type: cmark_node_type)
     return access cmark_node;  -- /usr/local/include/cmark.h:111
   pragma Import(C, cmark_node_new, "cmark_node_new");

  --* Same as `cmark_node_new`, but explicitly listing the memory
   -- * allocator used to allocate the node.  Note:  be sure to use the same
   -- * allocator for every node in a tree, or bad things can happen.
   --

   function cmark_node_new_with_mem(c_type: cmark_node_type;
      mem: access cmark_mem)
     return access cmark_node;  -- /usr/local/include/cmark.h:117
   pragma Import(C, cmark_node_new_with_mem, "cmark_node_new_with_mem");

  --* Frees the memory allocated for a node and any children.
   --

   procedure cmark_node_free
     (node: access cmark_node);  -- /usr/local/include/cmark.h:122
   pragma Import(C, cmark_node_free, "cmark_node_free");

  --*
   -- * ## Tree Traversal
   --

  --* Returns the next node in the sequence after 'node', or NULL if
   -- * there is none.
   --

   function cmark_node_next
     (node: access cmark_node)
     return access cmark_node;  -- /usr/local/include/cmark.h:131
   pragma Import(C, cmark_node_next, "cmark_node_next");

  --* Returns the previous node in the sequence after 'node', or NULL if
   -- * there is none.
   --

   function cmark_node_previous
     (node: access cmark_node)
     return access cmark_node;  -- /usr/local/include/cmark.h:136
   pragma Import(C, cmark_node_previous, "cmark_node_previous");

  --* Returns the parent of 'node', or NULL if there is none.
   --

   function cmark_node_parent
     (node: access cmark_node)
     return access cmark_node;  -- /usr/local/include/cmark.h:140
   pragma Import(C, cmark_node_parent, "cmark_node_parent");

  --* Returns the first child of 'node', or NULL if 'node' has no children.
   --

   function cmark_node_first_child
     (node: access cmark_node)
     return access cmark_node;  -- /usr/local/include/cmark.h:144
   pragma Import(C, cmark_node_first_child, "cmark_node_first_child");

  --* Returns the last child of 'node', or NULL if 'node' has no children.
   --

   function cmark_node_last_child
     (node: access cmark_node)
     return access cmark_node;  -- /usr/local/include/cmark.h:148
   pragma Import(C, cmark_node_last_child, "cmark_node_last_child");

  --*
   -- * ## Iterator
   -- *
-- * An iterator will walk through a tree of nodes, starting from a root
-- * node, returning one node at a time, together with information about
-- * whether the node is being entered or exited.  The iterator will
-- * first descend to a child node, if there is one.  When there is no
-- * child, the iterator will go to the next sibling.  When there is no
-- * next sibling, the iterator will return to the parent (but with
-- * a 'cmark_event_type' of `CMARK_EVENT_EXIT`).  The iterator will
-- * return `CMARK_EVENT_DONE` when it reaches the root node again.
-- * One natural application is an HTML renderer, where an `ENTER` event
-- * outputs an open tag and an `EXIT` event outputs a close tag.
-- * An iterator might also be used to transform an AST in some systematic
-- * way, for example, turning all level-3 headings into regular paragraphs.
-- *
-- *     void
-- *     usage_example(cmark_node *root) {
-- *         cmark_event_type ev_type;
-- *         cmark_iter *iter = cmark_iter_new(root);
-- *
-- *         while ((ev_type = cmark_iter_next(iter)) != CMARK_EVENT_DONE) {
-- *             cmark_node *cur = cmark_iter_get_node(iter);
-- *             // Do something with `cur` and `ev_type`
-- *         }
-- *
-- *         cmark_iter_free(iter);
-- *     }
-- *
-- * Iterators will never return `EXIT` events for leaf nodes, which are nodes
-- * of type:
-- *
-- * * CMARK_NODE_HTML_BLOCK
-- * * CMARK_NODE_THEMATIC_BREAK
-- * * CMARK_NODE_CODE_BLOCK
-- * * CMARK_NODE_TEXT
-- * * CMARK_NODE_SOFTBREAK
-- * * CMARK_NODE_LINEBREAK
-- * * CMARK_NODE_CODE
-- * * CMARK_NODE_HTML_INLINE
-- *
-- * Nodes must only be modified after an `EXIT` event, or an `ENTER` event for
-- * leaf nodes.
   --

   type cmark_event_type is
     (CMARK_EVENT_NONE, CMARK_EVENT_DONE, CMARK_EVENT_ENTER, CMARK_EVENT_EXIT);
   pragma Convention(C, cmark_event_type);  -- /usr/local/include/cmark.h:200

  --* Creates a new iterator starting at 'root'.  The current node and event
-- * type are undefined until 'cmark_iter_next' is called for the first time.
-- * The memory allocated for the iterator should be released using
-- * 'cmark_iter_free' when it is no longer needed.
   --

   function cmark_iter_new
     (root: access cmark_node)
     return access cmark_iter;  -- /usr/local/include/cmark.h:208
   pragma Import(C, cmark_iter_new, "cmark_iter_new");

  --* Frees the memory allocated for an iterator.
   --

   procedure cmark_iter_free
     (iter: access cmark_iter);  -- /usr/local/include/cmark.h:213
   pragma Import(C, cmark_iter_free, "cmark_iter_free");

  --* Advances to the next node and returns the event type (`CMARK_EVENT_ENTER`,
   -- * `CMARK_EVENT_EXIT` or `CMARK_EVENT_DONE`).
   --

   function cmark_iter_next
     (iter: access cmark_iter)
     return cmark_event_type;  -- /usr/local/include/cmark.h:219
   pragma Import(C, cmark_iter_next, "cmark_iter_next");

  --* Returns the current node.
   --

   function cmark_iter_get_node
     (iter: access cmark_iter)
     return access cmark_node;  -- /usr/local/include/cmark.h:224
   pragma Import(C, cmark_iter_get_node, "cmark_iter_get_node");

  --* Returns the current event type.
   --

   function cmark_iter_get_event_type
     (iter: access cmark_iter)
     return cmark_event_type;  -- /usr/local/include/cmark.h:229
   pragma Import(C, cmark_iter_get_event_type, "cmark_iter_get_event_type");

  --* Returns the root node.
   --

   function cmark_iter_get_root
     (iter: access cmark_iter)
     return access cmark_node;  -- /usr/local/include/cmark.h:234
   pragma Import(C, cmark_iter_get_root, "cmark_iter_get_root");

  --* Resets the iterator so that the current node is 'current' and
   -- * the event type is 'event_type'.  The new current node must be a
   -- * descendant of the root node or the root node itself.
   --

   procedure cmark_iter_reset(iter: access cmark_iter;
      current: access cmark_node;
      event_type: cmark_event_type);  -- /usr/local/include/cmark.h:241
   pragma Import(C, cmark_iter_reset, "cmark_iter_reset");

  --*
   -- * ## Accessors
   --

  --* Returns the user data of 'node'.
   --

   function cmark_node_get_user_data
     (node: access cmark_node) return System
     .Address;  -- /usr/local/include/cmark.h:250
   pragma Import(C, cmark_node_get_user_data, "cmark_node_get_user_data");

  --* Sets arbitrary user data for 'node'.  Returns 1 on success,
   -- * 0 on failure.
   --

   function cmark_node_set_user_data(node: access cmark_node;
      user_data: System.Address) return int;  -- /usr/local/include/cmark.h:255
   pragma Import(C, cmark_node_set_user_data, "cmark_node_set_user_data");

  --* Returns the type of 'node', or `CMARK_NODE_NONE` on error.
   --

   function cmark_node_get_type
     (node: access cmark_node)
     return cmark_node_type;  -- /usr/local/include/cmark.h:259
   pragma Import(C, cmark_node_get_type, "cmark_node_get_type");

  --* Like 'cmark_node_get_type', but returns a string representation
   --    of the type, or `"<unknown>"`.
   --

   function cmark_node_get_type_string
     (node: access cmark_node) return Interfaces.C.Strings
     .chars_ptr;  -- /usr/local/include/cmark.h:265
   pragma Import(C, cmark_node_get_type_string, "cmark_node_get_type_string");

  --* Returns the string contents of 'node', or an empty
   --    string if none is set.  Returns NULL if called on a
   --    node that does not have string content.
   --

   function cmark_node_get_literal
     (node: access cmark_node) return Interfaces.C.Strings
     .chars_ptr;  -- /usr/local/include/cmark.h:271
   pragma Import(C, cmark_node_get_literal, "cmark_node_get_literal");

  --* Sets the string contents of 'node'.  Returns 1 on success,
   -- * 0 on failure.
   --

   function cmark_node_set_literal(node: access cmark_node;
      content: Interfaces.C.Strings.chars_ptr)
     return int;  -- /usr/local/include/cmark.h:276
   pragma Import(C, cmark_node_set_literal, "cmark_node_set_literal");

  --* Returns the heading level of 'node', or 0 if 'node' is not a heading.
   --

   function cmark_node_get_heading_level
     (node: access cmark_node) return int;  -- /usr/local/include/cmark.h:280
   pragma Import(C, cmark_node_get_heading_level,
      "cmark_node_get_heading_level");

   -- For backwards compatibility
  --* Sets the heading level of 'node', returning 1 on success and 0 on error.
   --

   function cmark_node_set_heading_level(node: access cmark_node;
      level: int) return int;  -- /usr/local/include/cmark.h:288
   pragma Import(C, cmark_node_set_heading_level,
      "cmark_node_set_heading_level");

  --* Returns the list type of 'node', or `CMARK_NO_LIST` if 'node'
   -- * is not a list.
   --

   function cmark_node_get_list_type
     (node: access cmark_node)
     return cmark_list_type;  -- /usr/local/include/cmark.h:293
   pragma Import(C, cmark_node_get_list_type, "cmark_node_get_list_type");

  --* Sets the list type of 'node', returning 1 on success and 0 on error.
   --

   function cmark_node_set_list_type(node: access cmark_node;
      c_type: cmark_list_type) return int;  -- /usr/local/include/cmark.h:297
   pragma Import(C, cmark_node_set_list_type, "cmark_node_set_list_type");

  --* Returns the list delimiter type of 'node', or `CMARK_NO_DELIM` if 'node'
   -- * is not a list.
   --

   function cmark_node_get_list_delim
     (node: access cmark_node)
     return cmark_delim_type;  -- /usr/local/include/cmark.h:303
   pragma Import(C, cmark_node_get_list_delim, "cmark_node_get_list_delim");

  --* Sets the list delimiter type of 'node', returning 1 on success and 0
   -- * on error.
   --

   function cmark_node_set_list_delim(node: access cmark_node;
      delim: cmark_delim_type) return int;  -- /usr/local/include/cmark.h:308
   pragma Import(C, cmark_node_set_list_delim, "cmark_node_set_list_delim");

  --* Returns starting number of 'node', if it is an ordered list, otherwise 0.
   --

   function cmark_node_get_list_start
     (node: access cmark_node) return int;  -- /usr/local/include/cmark.h:313
   pragma Import(C, cmark_node_get_list_start, "cmark_node_get_list_start");

  --* Sets starting number of 'node', if it is an ordered list. Returns 1
   -- * on success, 0 on failure.
   --

   function cmark_node_set_list_start(node: access cmark_node;
      start: int) return int;  -- /usr/local/include/cmark.h:318
   pragma Import(C, cmark_node_set_list_start, "cmark_node_set_list_start");

  --* Returns 1 if 'node' is a tight list, 0 otherwise.
   --

   function cmark_node_get_list_tight
     (node: access cmark_node) return int;  -- /usr/local/include/cmark.h:322
   pragma Import(C, cmark_node_get_list_tight, "cmark_node_get_list_tight");

  --* Sets the "tightness" of a list.  Returns 1 on success, 0 on failure.
   --

   function cmark_node_set_list_tight(node: access cmark_node;
      tight: int) return int;  -- /usr/local/include/cmark.h:326
   pragma Import(C, cmark_node_set_list_tight, "cmark_node_set_list_tight");

  --* Returns the info string from a fenced code block.
   --

   function cmark_node_get_fence_info
     (node: access cmark_node) return Interfaces.C.Strings
     .chars_ptr;  -- /usr/local/include/cmark.h:330
   pragma Import(C, cmark_node_get_fence_info, "cmark_node_get_fence_info");

  --* Sets the info string in a fenced code block, returning 1 on
   -- * success and 0 on failure.
   --

   function cmark_node_set_fence_info(node: access cmark_node;
      info: Interfaces.C.Strings.chars_ptr)
     return int;  -- /usr/local/include/cmark.h:335
   pragma Import(C, cmark_node_set_fence_info, "cmark_node_set_fence_info");

  --* Returns the URL of a link or image 'node', or an empty string
   --    if no URL is set.  Returns NULL if called on a node that is
   --    not a link or image.
   --

   function cmark_node_get_url
     (node: access cmark_node) return Interfaces.C.Strings
     .chars_ptr;  -- /usr/local/include/cmark.h:341
   pragma Import(C, cmark_node_get_url, "cmark_node_get_url");

  --* Sets the URL of a link or image 'node'. Returns 1 on success,
   -- * 0 on failure.
   --

   function cmark_node_set_url(node: access cmark_node;
      url: Interfaces.C.Strings.chars_ptr)
     return int;  -- /usr/local/include/cmark.h:346
   pragma Import(C, cmark_node_set_url, "cmark_node_set_url");

  --* Returns the title of a link or image 'node', or an empty
   --    string if no title is set.  Returns NULL if called on a node
   --    that is not a link or image.
   --

   function cmark_node_get_title
     (node: access cmark_node) return Interfaces.C.Strings
     .chars_ptr;  -- /usr/local/include/cmark.h:352
   pragma Import(C, cmark_node_get_title, "cmark_node_get_title");

  --* Sets the title of a link or image 'node'. Returns 1 on success,
   -- * 0 on failure.
   --

   function cmark_node_set_title(node: access cmark_node;
      title: Interfaces.C.Strings.chars_ptr)
     return int;  -- /usr/local/include/cmark.h:357
   pragma Import(C, cmark_node_set_title, "cmark_node_set_title");

  --* Returns the literal "on enter" text for a custom 'node', or
   --    an empty string if no on_enter is set.  Returns NULL if called
   --    on a non-custom node.
   --

   function cmark_node_get_on_enter
     (node: access cmark_node) return Interfaces.C.Strings
     .chars_ptr;  -- /usr/local/include/cmark.h:363
   pragma Import(C, cmark_node_get_on_enter, "cmark_node_get_on_enter");

  --* Sets the literal text to render "on enter" for a custom 'node'.
   --    Any children of the node will be rendered after this text.
   --    Returns 1 on success 0 on failure.
   --

   function cmark_node_set_on_enter(node: access cmark_node;
      on_enter: Interfaces.C.Strings.chars_ptr)
     return int;  -- /usr/local/include/cmark.h:369
   pragma Import(C, cmark_node_set_on_enter, "cmark_node_set_on_enter");

  --* Returns the literal "on exit" text for a custom 'node', or
   --    an empty string if no on_exit is set.  Returns NULL if
   --    called on a non-custom node.
   --

   function cmark_node_get_on_exit
     (node: access cmark_node) return Interfaces.C.Strings
     .chars_ptr;  -- /usr/local/include/cmark.h:376
   pragma Import(C, cmark_node_get_on_exit, "cmark_node_get_on_exit");

  --* Sets the literal text to render "on exit" for a custom 'node'.
   --    Any children of the node will be rendered before this text.
   --    Returns 1 on success 0 on failure.
   --

   function cmark_node_set_on_exit(node: access cmark_node;
      on_exit: Interfaces.C.Strings.chars_ptr)
     return int;  -- /usr/local/include/cmark.h:382
   pragma Import(C, cmark_node_set_on_exit, "cmark_node_set_on_exit");

  --* Returns the line on which 'node' begins.
   --

   function cmark_node_get_start_line
     (node: access cmark_node) return int;  -- /usr/local/include/cmark.h:386
   pragma Import(C, cmark_node_get_start_line, "cmark_node_get_start_line");

  --* Returns the column at which 'node' begins.
   --

   function cmark_node_get_start_column
     (node: access cmark_node) return int;  -- /usr/local/include/cmark.h:390
   pragma Import(C, cmark_node_get_start_column,
      "cmark_node_get_start_column");

  --* Returns the line on which 'node' ends.
   --

   function cmark_node_get_end_line
     (node: access cmark_node) return int;  -- /usr/local/include/cmark.h:394
   pragma Import(C, cmark_node_get_end_line, "cmark_node_get_end_line");

  --* Returns the column at which 'node' ends.
   --

   function cmark_node_get_end_column
     (node: access cmark_node) return int;  -- /usr/local/include/cmark.h:398
   pragma Import(C, cmark_node_get_end_column, "cmark_node_get_end_column");

  --*
   -- * ## Tree Manipulation
   --

  --* Unlinks a 'node', removing it from the tree, but not freeing its
   -- * memory.  (Use 'cmark_node_free' for that.)
   --

   procedure cmark_node_unlink
     (node: access cmark_node);  -- /usr/local/include/cmark.h:407
   pragma Import(C, cmark_node_unlink, "cmark_node_unlink");

  --* Inserts 'sibling' before 'node'.  Returns 1 on success, 0 on failure.
   --

   function cmark_node_insert_before(node: access cmark_node;
      sibling: access cmark_node)
     return int;  -- /usr/local/include/cmark.h:411
   pragma Import(C, cmark_node_insert_before, "cmark_node_insert_before");

  --* Inserts 'sibling' after 'node'. Returns 1 on success, 0 on failure.
   --

   function cmark_node_insert_after(node: access cmark_node;
      sibling: access cmark_node)
     return int;  -- /usr/local/include/cmark.h:416
   pragma Import(C, cmark_node_insert_after, "cmark_node_insert_after");

  --* Replaces 'oldnode' with 'newnode' and unlinks 'oldnode' (but does
   -- * not free its memory).
   -- * Returns 1 on success, 0 on failure.
   --

   function cmark_node_replace(oldnode: access cmark_node;
      newnode: access cmark_node)
     return int;  -- /usr/local/include/cmark.h:422
   pragma Import(C, cmark_node_replace, "cmark_node_replace");

  --* Adds 'child' to the beginning of the children of 'node'.
   -- * Returns 1 on success, 0 on failure.
   --

   function cmark_node_prepend_child(node: access cmark_node;
      child: access cmark_node) return int;  -- /usr/local/include/cmark.h:427
   pragma Import(C, cmark_node_prepend_child, "cmark_node_prepend_child");

  --* Adds 'child' to the end of the children of 'node'.
   -- * Returns 1 on success, 0 on failure.
   --

   function cmark_node_append_child(node: access cmark_node;
      child: access cmark_node) return int;  -- /usr/local/include/cmark.h:432
   pragma Import(C, cmark_node_append_child, "cmark_node_append_child");

  --* Consolidates adjacent text nodes.
   --

   procedure cmark_consolidate_text_nodes
     (root: access cmark_node);  -- /usr/local/include/cmark.h:436
   pragma Import(C, cmark_consolidate_text_nodes,
      "cmark_consolidate_text_nodes");

  --*
   -- * ## Parsing
   -- *
   -- * Simple interface:
   -- *
   -- *     cmark_node *document = cmark_parse_document("Hello *world*", 13,
   -- *                                                 CMARK_OPT_DEFAULT);
   -- *
   -- * Streaming interface:
   -- *
   -- *     cmark_parser *parser = cmark_parser_new(CMARK_OPT_DEFAULT);
   -- *     FILE *fp = fopen("myfile.md", "rb");
   -- *     while ((bytes = fread(buffer, 1, sizeof(buffer), fp)) > 0) {
   -- *             cmark_parser_feed(parser, buffer, bytes);
   -- *             if (bytes < sizeof(buffer)) {
   -- *                 break;
   -- *             }
   -- *     }
   -- *     document = cmark_parser_finish(parser);
   -- *     cmark_parser_free(parser);
   --

  --* Creates a new parser object.
   --

   function cmark_parser_new
     (options: int)
     return access cmark_parser;  -- /usr/local/include/cmark.h:463
   pragma Import(C, cmark_parser_new, "cmark_parser_new");

  --* Creates a new parser object with the given memory allocator
   --

   function cmark_parser_new_with_mem(options: int;
      mem: access cmark_mem)
     return access cmark_parser;  -- /usr/local/include/cmark.h:468
   pragma Import(C, cmark_parser_new_with_mem, "cmark_parser_new_with_mem");

  --* Frees memory allocated for a parser object.
   --

   procedure cmark_parser_free
     (parser: access cmark_parser);  -- /usr/local/include/cmark.h:473
   pragma Import(C, cmark_parser_free, "cmark_parser_free");

  --* Feeds a string of length 'len' to 'parser'.
   --

   procedure cmark_parser_feed(parser: access cmark_parser;
      buffer: Interfaces.C.Strings.chars_ptr;
      len: stddef_h.size_t);  -- /usr/local/include/cmark.h:478
   pragma Import(C, cmark_parser_feed, "cmark_parser_feed");

  --* Finish parsing and return a pointer to a tree of nodes.
   --

   function cmark_parser_finish
     (parser: access cmark_parser)
     return access cmark_node;  -- /usr/local/include/cmark.h:483
   pragma Import(C, cmark_parser_finish, "cmark_parser_finish");

  --* Parse a CommonMark document in 'buffer' of length 'len'.
   -- * Returns a pointer to a tree of nodes.  The memory allocated for
   -- * the node tree should be released using 'cmark_node_free'
   -- * when it is no longer needed.
   --

   function cmark_parse_document(buffer: Interfaces.C.Strings.chars_ptr;
      len: stddef_h.size_t;
      options: int)
     return access cmark_node;  -- /usr/local/include/cmark.h:491
   pragma Import(C, cmark_parse_document, "cmark_parse_document");

  --* Parse a CommonMark document in file 'f', returning a pointer to
   -- * a tree of nodes.  The memory allocated for the node tree should be
   -- * released using 'cmark_node_free' when it is no longer needed.
   --

   function cmark_parse_file(f: access bits_types_FILE_h.FILE;
      options: int)
     return access cmark_node;  -- /usr/local/include/cmark.h:498
   pragma Import(C, cmark_parse_file, "cmark_parse_file");

  --*
   -- * ## Rendering
   --

  --* Render a 'node' tree as XML.  It is the caller's responsibility
   -- * to free the returned buffer.
   --

   function cmark_render_xml(root: access cmark_node;
      options: int) return Interfaces.C.Strings
     .chars_ptr;  -- /usr/local/include/cmark.h:508
   pragma Import(C, cmark_render_xml, "cmark_render_xml");

  --* Render a 'node' tree as an HTML fragment.  It is up to the user
   -- * to add an appropriate header and footer. It is the caller's
   -- * responsibility to free the returned buffer.
   --

   function cmark_render_html(root: access cmark_node;
      options: int) return Interfaces.C.Strings
     .chars_ptr;  -- /usr/local/include/cmark.h:515
   pragma Import(C, cmark_render_html, "cmark_render_html");

  --* Render a 'node' tree as a groff man page, without the header.
   -- * It is the caller's responsibility to free the returned buffer.
   --

   function cmark_render_man(root: access cmark_node; options: int;
      width: int) return Interfaces.C.Strings
     .chars_ptr;  -- /usr/local/include/cmark.h:521
   pragma Import(C, cmark_render_man, "cmark_render_man");

  --* Render a 'node' tree as a commonmark document.
   -- * It is the caller's responsibility to free the returned buffer.
   --

   function cmark_render_commonmark(root: access cmark_node; options: int;
      width: int) return Interfaces.C.Strings
     .chars_ptr;  -- /usr/local/include/cmark.h:527
   pragma Import(C, cmark_render_commonmark, "cmark_render_commonmark");

  --* Render a 'node' tree as a LaTeX document.
   -- * It is the caller's responsibility to free the returned buffer.
   --

   function cmark_render_latex(root: access cmark_node; options: int;
      width: int) return Interfaces.C.Strings
     .chars_ptr;  -- /usr/local/include/cmark.h:533
   pragma Import(C, cmark_render_latex, "cmark_render_latex");

  --*
   -- * ## Options
   --

  --* Default options.
   --

  --*
   -- * ### Options affecting rendering
   --

  --* Include a `data-sourcepos` attribute on all block elements.
   --

  --* Render `softbreak` elements as hard line breaks.
   --

  --* Suppress raw HTML and unsafe links (`javascript:`, `vbscript:`,
   -- * `file:`, and `data:`, except for `image/png`, `image/gif`,
   -- * `image/jpeg`, or `image/webp` mime types).  Raw HTML is replaced
   -- * by a placeholder HTML comment. Unsafe links are replaced by
   -- * empty strings.
   --

  --* Render `softbreak` elements as spaces.
   --

  --*
   -- * ### Options affecting parsing
   --

  --* Legacy option (no effect).
   --

  --* Validate UTF-8 in the input before parsing, replacing illegal
   -- * sequences with the replacement character U+FFFD.
   --

  --* Convert straight quotes to curly, --- to em dashes, -- to en dashes.
   --

  --*
   -- * ## Version information
   --

  --* The library version as integer for runtime checks. Also available as
   -- * macro CMARK_VERSION for compile time checks.
   -- *
   -- * * Bits 16-23 contain the major version.
   -- * * Bits 8-15 contain the minor version.
   -- * * Bits 0-7 contain the patchlevel.
   -- *
   -- * In hexadecimal format, the number 0x010203 represents version 1.2.3.
   --

   function cmark_version return int;  -- /usr/local/include/cmark.h:598
   pragma Import(C, cmark_version, "cmark_version");

  --* The library version string for runtime checks. Also available as
   -- * macro CMARK_VERSION_STRING for compile time checks.
   --

   function cmark_version_string return Interfaces.C.Strings
     .chars_ptr;  -- /usr/local/include/cmark.h:604
   pragma Import(C, cmark_version_string, "cmark_version_string");

  --* # AUTHORS
   -- *
   -- * John MacFarlane, Vicent Marti,  Kārlis Gaņģis, Nick Wellnhofer.
   --

end cmark_h;
