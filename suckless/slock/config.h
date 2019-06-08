/* user and group to drop privileges to */
static const char *user  = "nobody";
static const char *group = "nogroup";

static const char *colorname[NUMCOLS] = {
//	[INIT] =   "black",     /* after initialization */
//	[INPUT] =  "#005577",   /* during input */
//	[FAILED] = "#CC3333",   /* wrong password */
	[INIT] =   "#2E3440",     /* after initialization */
	[INPUT] =  "#3B4252",   /* during input */
	[FAILED] = "#D8DEE9",   /* wrong password */
};

/* treat a cleared input like a wrong password (color) */
static const int failonclear = 1;
