#
# Cookbook Name:: lv
# Recipe:: default
#
# Copyright 2013, snj14
#
case node[:platform]

when "centos","redhat","fedora","suse"
  %w{compat-libtermcap}.each do |package_name|
    package package_name do
      action :install
    end
  end

  remote_file "/tmp/lv.rpm" do
    source "http://archives.fedoraproject.org/pub/archive/fedora/linux/core/6/x86_64/os/Fedora/RPMS/lv-4.51-8.1.x86_64.rpm"
    mode 00644
    # A SHA256 (or portion thereof) of the file.
    checksum "cc0e22f9e9433820155a48e3c6356843c7de8b3b86b7760ea3fd69ce450fc0ec"
  end

  package "lv" do
    action :install
    source "/tmp/lv.rpm"
    provider Chef::Provider::Package::Rpm
  end

when "debian","ubuntu"
  package "lv" do
    action :install
  end
end
