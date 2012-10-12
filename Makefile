#
# 
# TODOs
# TODO: add md5 verify to tomee download

build_dir = ./build
pkg_dir = ./build/plugin
tomee_url="http://ftp.heanet.ie/mirrors/www.apache.org/dist/openejb/openejb-4.5.0/apache-tomee-1.5.0-webprofile.zip"
tomee_md5=1c2fb4e672d396d10035ec949a421021
compile:
	mkdir -p "$(build_dir)"

	@if [ -e tomee15 ]; then \
	   echo "Skipping tomEE download"; \
	else \
	   echo "Downloading TomEE..."; \
	   curl -o "$(build_dir)/tomee.zip" $(tomee_url) ; \
	   unzip -d "$(build_dir)" "$(build_dir)/tomee.zip"; \
	   mv "$(build_dir)/apache-tomee-*" "./tomee15"; \
	   rm -rf "./tomee15/webapps/{host-manager,manager,ROOT,docs}"; \
	fi

package: compile
	jar cvf "$(build_dir)/tomee15-plugin.zip" control server setup tomee15

clean:
	rm -rf "$(build_dir)"
	rm -rf "./tomee15" 

