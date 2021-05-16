import weakref

from fspy.decorators import deprecated
from fsui.qt import QObject

# Inheriting from QObject in order to be able to have signals associated
# with subclasses of Group.


class Group(QObject):
    def __init__(self, parent):
        super().__init__()
        self._parent = weakref.ref(parent)
        if hasattr(parent, "_window"):
            # noinspection PyProtectedMember
            self._window = parent._window
        self.position = (0, 0)
        self.__visible = True

    # @property
    def parent(self):
        return self._parent()

    # def show_or_hide(self, show):
    #     self.__visible = show

    @deprecated
    def is_visible(self):
        return self.visible()

    def onDestroy(self):
        pass

    def get_window(self):
        return self.parent().get_window()

    def get_container(self):
        return self.parent().get_container()

    def get_min_width(self):
        return self.layout.get_min_width()

    def get_min_height(self, width):
        return self.layout.get_min_height(width)

    def set_position(self, position):
        self.position = position
        if self.layout:
            self.layout.set_position(position)

    def set_size(self, size):
        if self.layout:
            self.layout.set_size(size)

    def set_position_and_size(self, position, size):
        self.position = position
        if self.layout:
            self.layout.set_position_and_size(position, size)

    def visible(self):
        return self.__visible
