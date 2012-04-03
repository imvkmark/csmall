<?php defined('IN_WSLM') or exit('Access Denied'); ?>            <!-- footer start -->
            <div class="footer">
                <div class="menus">
                    <dl><img src="images/insert/foot_advice.jpg" /></dl>
                    <ul>
                        <a href="">首  页</a>
                        <span>--</span>
                        <a href="">关于我们</a>
                        <span>--</span>
                        <a href="">人才招聘</a>
                        <span>--</span>
                        <a href="">网站地图</a>
                        <span>--</span>
                        <a href="">法律声明</a>
                        <span>--</span>
                        <a href="">在线咨询</a>
                        <span>--</span>
                        <a href="">投诉建议</a>
                    </ul>
                </div>
                <div class="about">
                	<?php echo block_edit('about', 1);?>
                </div>
                <div class="link-logo">
                	{tag_link_logo}
                </div>
                <div class="link-text">
                	{tag_link_text}
                </div>
                <div class="copyright">
                	<!--版权和 ICP NO-->
<?php echo $WLSL['copyright'];?> <?php echo $WLSL['icpno'];?>
                </div>
                <a href="http://www.zgweb.com" style="font-size: 12px;font-weight: bold;display:none;">麦谷网络</a> 
<a href="http://www.zgweb.com" style="font-size: 12px;font-weight: bold;display:none;">网站建设</a> 
<a href="http://www.zgweb.com" style="font-size: 12px;font-weight: bold;display:none;">网站制作</a>
            </div>
        </div>
    </div>
</body>
</html>