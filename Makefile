CONFIG_ROOT := $(PIN_ROOT)/source/tools/Config
include $(CONFIG_ROOT)/makefile.config

TOOL_CXXFLAGS += -std=c++11 -Wno-format
TOOL_ROOTS := Resolver

$(OBJDIR)Resolver$(PINTOOL_SUFFIX): $(OBJDIR)Resolver$(OBJ_SUFFIX) $(OBJDIR)ImageManager$(OBJ_SUFFIX) $(OBJDIR)jsoncpp$(OBJ_SUFFIX)
	$(LINKER) $(TOOL_LDFLAGS) $(LINK_EXE)$@ $^ $(TOOL_LPATHS) $(TOOL_LIBS)

include $(TOOLS_ROOT)/Config/makefile.default.rules
