"""A Sublime Text plugin to ensure that exactly one trailing
newline is at the end of all files when files are saved.

License: MIT License
"""
import sublime
import sublime_plugin


class OnSaveListener(sublime_plugin.EventListener):
    def on_pre_save(self, view):
        # A sublime_plugin.TextCommand class is needed for an edit object.
        view.run_command('on_save')


class OnSaveCommand(sublime_plugin.TextCommand):
    def run(self, edit):
        # Ignore empty files.
        if self.view.size() == 0:
            return

        # Work backwards from the end of the file looking for the last
        # significant char (one that is neither whitespace nor a newline).

        pos = self.view.size() - 1
        char = self.view.substr(pos)

        while pos >= 0 and char in ['\n', '\t', ' ']:
            pos -= 1
            char = self.view.substr(pos)

        # Delete from the last significant char to the end of
        # the file and then add a single trailing newline.

        del_region = sublime.Region(pos + 1, self.view.size())
        self.view.erase(edit, del_region)
        self.view.insert(edit, self.view.size(), "\n")
