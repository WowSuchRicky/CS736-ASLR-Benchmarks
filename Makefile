CC := gcc48
CFLAGS := -pthread -ggdb -fPIE
INCLUDE := -I include

CFLAGS := $(CFLAGS) $(BUILD_FLAGS)

PERFORMANCE := \
	performance1 \
	performance2 \
	performance3 \
	performance3_helper \
	performance4 \
	performance4_helper

ENTROPY := \
	entropy1 \
	entropy2 \
	entropy3


UTIL := \
	calc

CLEAN := $(PERFORMANCE)	$(UTIL) $(ENTROPY)
JUNK := output.txt child.txt parent.txt

all: $(PERFORMANCE) $(UTIL) $(ENTROPY)

%: entropy/%.c
	$(CC) $(CFLAGS) $(INCLUDE)  $< -o $@
%: performance/%.c
	$(CC) $(CFLAGS) $(INCLUDE) $< -o $@
%: util/%.c
	$(CC) $(CFLAGS) $(INCLUDE) $< -o $@

clean:
	rm -rf $(CLEAN) $(JUNK)
