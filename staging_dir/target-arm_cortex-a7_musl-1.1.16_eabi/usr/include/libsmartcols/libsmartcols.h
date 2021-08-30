/*
 * Prints table or tree.
 *
 * Copyright (C) 2014 Ondrej Oprala <ooprala@redhat.com>
 * Copyright (C) 2014 Karel Zak <kzak@redhat.com>
 *
 * This file may be redistributed under the terms of the
 * GNU Lesser General Public License.
 */
#ifndef _LIBSMARTCOLS_H
#define _LIBSMARTCOLS_H

#ifdef __cplusplus
extern "C" {
#endif

#include <stdlib.h>
#include <stdio.h>
#include <sys/types.h>

/**
 * LIBSMARTCOLS_VERSION:
 *
 * Library version string
 */
#define LIBSMARTCOLS_VERSION   "2.25.0"

/**
 * libscols_iter:
 *
 * Generic iterator
 */
struct libscols_iter;

/**
 * libscols_symbols:
 *
 * Symbol groups for printing tree hierarchies
 */
struct libscols_symbols;

/**
 * libscols_cell:
 *
 * A cell - the smallest library object
 */
struct libscols_cell;

/**
 * libscols_line:
 *
 * A line - an array of cells
 */
struct libscols_line;

/**
 * libscols_table:
 *
 * A table - The most abstract object, encapsulating lines, columns, symbols and cells
 */
struct libscols_table;

/**
 * libscols_column:
 *
 * A column - defines the number of columns and column names
 */
struct libscols_column;

/* iter.c */
enum {

	SCOLS_ITER_FORWARD = 0,
	SCOLS_ITER_BACKWARD
};

/*
 * Column flags
 */
enum {
	SCOLS_FL_TRUNC       = (1 << 0),   /* truncate fields data if necessary */
	SCOLS_FL_TREE        = (1 << 1),   /* use tree "ascii art" */
	SCOLS_FL_RIGHT	     = (1 << 2),   /* align to the right */
	SCOLS_FL_STRICTWIDTH = (1 << 3),   /* don't reduce width if column is empty */
	SCOLS_FL_NOEXTREMES  = (1 << 4),   /* ignore extreme fields when count column width*/
};

extern struct libscols_iter *scols_new_iter(int direction);
extern void scols_free_iter(struct libscols_iter *itr);
extern void scols_reset_iter(struct libscols_iter *itr, int direction);
extern int scols_iter_get_direction(struct libscols_iter *itr);

/* init.c */
extern void scols_init_debug(int mask);

/* version.c */
extern int scols_parse_version_string(const char *ver_string);
extern int scols_get_library_version(const char **ver_string);

/* symbols.c */
extern struct libscols_symbols *scols_new_symbols(void);
extern void scols_ref_symbols(struct libscols_symbols *sy);
extern void scols_unref_symbols(struct libscols_symbols *sy);
extern struct libscols_symbols *scols_copy_symbols(const struct libscols_symbols *sb);
extern int scols_symbols_set_branch(struct libscols_symbols *sb, const char *str);
extern int scols_symbols_set_vertical(struct libscols_symbols *sb, const char *str);
extern int scols_symbols_set_right(struct libscols_symbols *sb, const char *str);

/* cell.c */
extern int scols_reset_cell(struct libscols_cell *ce);
extern int scols_cell_copy_content(struct libscols_cell *dest,
				   const struct libscols_cell *src);
extern int scols_cell_set_data(struct libscols_cell *ce, const char *str);
extern int scols_cell_refer_data(struct libscols_cell *ce, char *str);
extern const char *scols_cell_get_data(const struct libscols_cell *ce);
extern int scols_cell_set_color(struct libscols_cell *ce, const char *color);
extern const char *scols_cell_get_color(const struct libscols_cell *ce);

extern void *scols_cell_get_userdata(struct libscols_cell *ce);
extern int scols_cell_set_userdata(struct libscols_cell *ce, void *data);

extern int scols_cmpstr_cells(struct libscols_cell *a,
			      struct libscols_cell *b, void *data);
/* column.c */
extern int scols_column_is_tree(struct libscols_column *cl);
extern int scols_column_is_trunc(struct libscols_column *cl);
extern int scols_column_is_right(struct libscols_column *cl);
extern int scols_column_is_strict_width(struct libscols_column *cl);
extern int scols_column_is_noextremes(struct libscols_column *cl);

extern int scols_column_set_flags(struct libscols_column *cl, int flags);
extern int scols_column_get_flags(struct libscols_column *cl);
extern struct libscols_column *scols_new_column(void);
extern void scols_ref_column(struct libscols_column *cl);
extern void scols_unref_column(struct libscols_column *cl);
extern struct libscols_column *scols_copy_column(const struct libscols_column *cl);
extern int scols_column_set_whint(struct libscols_column *cl, double whint);
extern double scols_column_get_whint(struct libscols_column *cl);
extern struct libscols_cell *scols_column_get_header(struct libscols_column *cl);
extern int scols_column_set_color(struct libscols_column *cl, const char *color);
extern const char *scols_column_get_color(struct libscols_column *cl);

extern int scols_column_set_cmpfunc(struct libscols_column *cl,
			int (*cmp)(struct libscols_cell *a,
				   struct libscols_cell *b, void *),
			void *data);

/* line.c */
extern struct libscols_line *scols_new_line(void);
extern void scols_ref_line(struct libscols_line *ln);
extern void scols_unref_line(struct libscols_line *ln);
extern int scols_line_alloc_cells(struct libscols_line *ln, size_t n);
extern void scols_line_free_cells(struct libscols_line *ln);
extern int scols_line_set_userdata(struct libscols_line *ln, void *data);
extern void *scols_line_get_userdata(struct libscols_line *ln);
extern int scols_line_remove_child(struct libscols_line *ln, struct libscols_line *child);
extern int scols_line_add_child(struct libscols_line *ln, struct libscols_line *child);
extern int scols_line_has_children(struct libscols_line *ln);
extern int scols_line_next_child(struct libscols_line *ln,
			  struct libscols_iter *itr, struct libscols_line **chld);
extern struct libscols_line *scols_line_get_parent(struct libscols_line *ln);
extern int scols_line_set_color(struct libscols_line *ln, const char *color);
extern const char *scols_line_get_color(struct libscols_line *ln);
extern size_t scols_line_get_ncells(struct libscols_line *ln);
extern struct libscols_cell *scols_line_get_cell(struct libscols_line *ln, size_t n);
extern struct libscols_cell *scols_line_get_column_cell(
		                        struct libscols_line *ln,
		                        struct libscols_column *cl);
extern int scols_line_set_data(struct libscols_line *ln, size_t n, const char *data);
extern int scols_line_refer_data(struct libscols_line *ln, size_t n, char *data);
extern struct libscols_line *scols_copy_line(struct libscols_line *ln);

/* table */
extern int scols_table_colors_wanted(struct libscols_table *tb);
extern int scols_table_is_raw(struct libscols_table *tb);
extern int scols_table_is_ascii(struct libscols_table *tb);
extern int scols_table_is_noheadings(struct libscols_table *tb);
extern int scols_table_is_empty(struct libscols_table *tb);
extern int scols_table_is_export(struct libscols_table *tb);
extern int scols_table_is_maxout(struct libscols_table *tb);
extern int scols_table_is_tree(struct libscols_table *tb);

extern int scols_table_enable_colors(struct libscols_table *tb, int enable);
extern int scols_table_enable_raw(struct libscols_table *tb, int enable);
extern int scols_table_enable_ascii(struct libscols_table *tb, int enable);
extern int scols_table_enable_noheadings(struct libscols_table *tb, int enable);
extern int scols_table_enable_export(struct libscols_table *tb, int enable);
extern int scols_table_enable_maxout(struct libscols_table *tb, int enable);

extern int scols_table_set_column_separator(struct libscols_table *tb, const char *sep);
extern int scols_table_set_line_separator(struct libscols_table *tb, const char *sep);

extern struct libscols_table *scols_new_table(void);
extern void scols_ref_table(struct libscols_table *tb);
extern void scols_unref_table(struct libscols_table *tb);
extern int scols_table_add_column(struct libscols_table *tb, struct libscols_column *cl);
extern int scols_table_remove_column(struct libscols_table *tb, struct libscols_column *cl);
extern int scols_table_remove_columns(struct libscols_table *tb);
extern struct libscols_column *scols_table_new_column(struct libscols_table *tb, const char *name, double whint, int flags);
extern int scols_table_next_column(struct libscols_table *tb, struct libscols_iter *itr, struct libscols_column **cl);
extern char *scols_table_get_column_separator(struct libscols_table *tb);
extern char *scols_table_get_line_separator(struct libscols_table *tb);
extern int scols_table_get_ncols(struct libscols_table *tb);
extern int scols_table_get_nlines(struct libscols_table *tb);
extern struct libscols_column *scols_table_get_column(struct libscols_table *tb, size_t n);
extern int scols_table_add_line(struct libscols_table *tb, struct libscols_line *ln);
extern int scols_table_remove_line(struct libscols_table *tb, struct libscols_line *ln);
extern void scols_table_remove_lines(struct libscols_table *tb);
extern int scols_table_next_line(struct libscols_table *tb, struct libscols_iter *itr, struct libscols_line **ln);
extern struct libscols_line *scols_table_new_line(struct libscols_table *tb, struct libscols_line *parent);
extern struct libscols_line *scols_table_get_line(struct libscols_table *tb, size_t n);
extern struct libscols_table *scols_copy_table(struct libscols_table *tb);
extern int scols_table_set_symbols(struct libscols_table *tb, struct libscols_symbols *sy);

extern int scols_table_set_stream(struct libscols_table *tb, FILE *stream);
extern FILE *scols_table_get_stream(struct libscols_table *tb);
extern int scols_table_reduce_termwidth(struct libscols_table *tb, size_t reduce);

extern int scols_sort_table(struct libscols_table *tb, struct libscols_column *cl);

/* table_print.c */
extern int scols_print_table(struct libscols_table *tb);
extern int scols_print_table_to_string(struct libscols_table *tb, char **data);

#ifdef __cplusplus
}
#endif

#endif /* _LIBSMARTCOLS_H */
