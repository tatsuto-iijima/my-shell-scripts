Describe 'listmd5'
  It 'Normal check'
    Data
    #|./LICENSE
    #|./README.md
    End
    When run ./bin/listmd5
    The line 1 should match pattern "????????????????????????????????  ./LICENSE"
    The line 2 should match pattern "????????????????????????????????  ./README.md"
    The status should be success
  End

  It 'Anomaly check'
    Data
    #|./LICENSE
    #|./hoge
    #|./README.md
    End
    When run ./bin/listmd5
    The line 1 should match pattern '????????????????????????????????  ./LICENSE'
    The line 2 should match pattern '????????????????????????????????  ./README.md'
    The status should be success
    The error should equal 'md5sum: ./hoge: No such file or directory'
  End
End