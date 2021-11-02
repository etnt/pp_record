#
#
#
ERLC=erlc
BEAM=$(patsubst %.erl,%.beam,$(wildcard src/*.erl))
ERLC_FLAGS= +debug_info +compressed


.PHONY: compile all

R = ./rebar3

compile:
	$(R) compile

all:: compile

clean:
	rm -rf _build ebin


.PHONY: old
old: ebin $(BEAM)
	if [ -d _build/default/lib/pp_record/ebin ]; then \
	  cp ebin/*.beam _build/default/lib/pp_record/ebin; \
	fi

ebin:
	mkdir ebin


%.beam: %.erl
	$(ERLC) $(ERLC_FLAGS) -o ebin $<
