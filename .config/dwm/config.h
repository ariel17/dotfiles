/* See LICENSE file for copyright and license details. */

/* appearance */
static const char font[]            = "-*-terminus-medium-r-*-*-16-*-*-*-*-*-*-*";
static const char normbordercolor[] = "#444444";
static const char normbgcolor[]     = "#222222";
static const char normfgcolor[]     = "#bbbbbb";
static const char selbordercolor[]  = "#005577";
static const char selbgcolor[]      = "#005577";
static const char selfgcolor[]      = "#eeeeee";
static const unsigned int borderpx  = 1;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const Bool showbar           = True;     /* False means no bar */
static const Bool topbar            = True;     /* False means bottom bar */

/* tagging */
static const char *tags[] = { "web", "term", "code", "im", "model", "anarchy", "music" };

static const Rule rules[] = {
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "Chromium",   NULL,       NULL,       1,            False,        -1 },
	{ "Firefox",    NULL,       NULL,       1,            False,        -1 },
	{ "Terminal",   NULL,       NULL,       2,            False,        -1 },
	{ "Gvim",       NULL,       NULL,       3,            False,        -1 },
	{ "Skype",      NULL,       NULL,       4,            False,        -1 },
	{ "Pidgin",     NULL,       NULL,       4,            False,        -1 },
	{ "ScudCloud",  NULL,       NULL,       7,            False,        -1 },
	{ "Rhythmbox",  NULL,       NULL,       7,            False,        -1 },
	{ "Spotify",    NULL,       NULL,       7,            False,        -1 },
};

/* layout(s) */
static const float mfact      = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster      = 1;    /* number of clients in master area */
static const Bool resizehints = True; /* True means respect size hints in tiled resizals */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
#define TERMINAL "x-terminal-emulator"
static const char *dmenucmd[] = { "dmenu_run", "-fn", font, "-nb", normbgcolor, "-nf", normfgcolor, "-sb", selbgcolor, "-sf", selfgcolor, NULL };
static const char *termcmd[]    = { TERMINAL, NULL };
static const char *gvim[]       = { "gvim", NULL };
static const char *scudcloud[]  = { "scudcloud", NULL };
static const char *skype[]      = { "skype", NULL };
static const char *chromium[]   = { "chromium-browser", NULL };
static const char *firefox[]    = { "firefox", NULL };
static const char *rhythmbox[]  = { "rhythmbox", NULL };
static const char *rhythmboxnext[]  = { "rhythmbox-client", "--next" };
static const char *rhythmboxplay[]  = { "rhythmbox-client", "--play-pause" };
static const char *rhythmboxprevious[]  = { "rhythmbox-client", "--previous" };
static const char *rhythmboxstop[]  = { "rhythmbox-client", "--stop" };
static const char *weechat[]    = { TERMINAL, "-e", "sh", "-c", "weechat", NULL };

static Key keys[] = {
	/* modifier           key        function        argument */
	// { MODKEY|ShiftMask,   XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,             XK_0,      view,           {.ui = ~0 } },
	{ MODKEY,             XK_Return, spawn,          {.v = termcmd } },
	{ MODKEY,             XK_Tab,    focusstack,     {.i = +1 } },
	{ MODKEY,             XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,             XK_d,      incnmaster,     {.i = -1 } },
	{ MODKEY,             XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,             XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY,             XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY,             XK_m,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY,             XK_p,      spawn,          {.v = dmenucmd } },
	{ MODKEY,             XK_period, focusmon,       {.i = +1 } },
	{ MODKEY,             XK_space,  setlayout,      {0} },
	{ MODKEY,             XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY|ShiftMask,   XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY|ShiftMask,   XK_Return, zoom,           {0} },
	{ MODKEY|ShiftMask,   XK_Tab,    view,           {0} },
	{ MODKEY|ShiftMask,   XK_b,      togglebar,      {0} },
	{ MODKEY|ShiftMask,   XK_c,      killclient,     {0} },
	{ MODKEY|ShiftMask,   XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,   XK_f,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY|ShiftMask,   XK_period, tagmon,         {.i = +1 } },
	{ MODKEY|ShiftMask,   XK_space,  togglefloating, {0} },

    /* Custom */
	{ MODKEY,             XK_b,      spawn,          {.v = chromium } },
	{ MODKEY,             XK_f,      spawn,          {.v = firefox } },
	{ MODKEY,             XK_g,      spawn,          {.v = gvim } },
	{ MODKEY,             XK_k,      spawn,          {.v = skype } },
	{ MODKEY,             XK_w,      spawn,          {.v = weechat } },
	{ MODKEY,             XK_x,      spawn,          {.v = rhythmbox } },
	{ MODKEY,             XK_z,      spawn,          {.v = scudcloud } },
	{ MODKEY|ControlMask, XK_p,      spawn,          {.v = rhythmboxplay } },
	{ MODKEY|ControlMask, XK_o,      spawn,          {.v = rhythmboxprevious } },
	{ MODKEY|ControlMask, XK_n,      spawn,          {.v = rhythmboxnext } },

	TAGKEYS(              XK_1,                      0)
	TAGKEYS(              XK_2,                      1)
	TAGKEYS(              XK_3,                      2)
	TAGKEYS(              XK_4,                      3)
	TAGKEYS(              XK_5,                      4)
	TAGKEYS(              XK_6,                      5)
	TAGKEYS(              XK_7,                      6)
	TAGKEYS(              XK_8,                      7)
	TAGKEYS(              XK_9,                      8)
	{ MODKEY|ShiftMask,   XK_q,      quit,           {0} },
};

/* button definitions */
/* click can be ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};
