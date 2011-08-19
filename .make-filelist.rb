$EXCLUDE_PATH = %w[
. .. backup backup1 backup2 backup-system lost+found tmp temp rubikitch.lost dev
.cache w3mtmp proxy-cache trash proc RCS.old
autom4te.cache blib _build .bzr .cdv cover_db CVS _darcs ~.dep ~.dot .git .hg ~.nib .pc ~.plst RCS SCCS _sgbak .svn
]

# Exclude regexps (backup files, core files, and so on)
$EXCLUDE_REGEXP = Regexp.union(/~$/, /\#.+\#$/, /[._].*\.swp$/, /core\.\d+$/, # from ack-grep
  /\.(?:elc|o)$/, /,v$/)

# Set default directories to collect
$LS_DIRS = [
  "~/.emacs.d",
  "~/",
  "/etc",
  "/usr",
  "/"
]
