<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="ProductDetail.aspx.cs" Inherits="Zteam.WebForm4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="nk-main">

        <!-- START: Breadcrumbs -->
        <div class="nk-gap-1"></div>
        <div class="container">
            <ul class="nk-breadcrumbs">

                <li><a href="Store.aspx">Store</a></li>

            </ul>
        </div>
        <div class="nk-gap-1"></div>
        <!-- END: Breadcrumbs -->

        <div class="container">
            <div class="row vertical-gap">
                <div class="col-lg-8">
                    <div class="nk-store-product">
                        <div class="row vertical-gap">

                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GAMES_SALES_PLATFORMConnectionString %>" SelectCommand="SELECT * FROM [OYUN] WHERE ([OYUN_ID] = @OYUN_ID)">
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="OYUN_ID" QueryStringField="OYUN_ID" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="Repeater1_ItemCommand">
                                <ItemTemplate>
                                    <div class="col-md-6">
                                        <!-- START: Product Photos -->
                                        <div class="nk-popup-gallery">
                                            <div class="nk-gallery-item-box">
                                                <a href="<%#Eval("FOTOGRAF") %>" class="nk-gallery-item">
                                                    <div class="nk-gallery-item-overlay"><span class="ion-eye"></span></div>
                                                    <img src="<%#Eval("FOTOGRAF") %>" alt="">
                                                </a>
                                                &nbsp;&nbsp;&nbsp;
                                            </div>
                                        </div>
                                        <!-- END: Product Photos -->
                                    </div>
                                    <div class="col-md-6">
                                        <asp:Label ID="lblPicture" Visible="false" runat="server" Text='<%#Eval("FOTOGRAF") %>'></asp:Label>
                                        <asp:Label ID="lblProductName" class="nk-product-title h3" Visible="true" runat="server" Text='<%#Eval("ADI") %>'></asp:Label>

                                        <div class="nk-product-description">
                                            <p>With what mingled joy and sorrow do I take up the pen to write to my dearest friend! Oh, what a change between to-day and yesterday! Now I am friendless and alone; yesterday I was at home, in the sweet company of a sister, whom I shall ever, ever cherish! I was awakened at daybreak by the charwoman, and having arrived at the inn, was at first placed inside the coach. But, when we got to a place called Leakington. Now the races of these two have been for some ages utterly extinct.</p>
                                        </div>

                                        <!-- START: Add to Cart -->
                                        <div class="nk-gap-2"></div>
                                        <div class="nk-product-addtocart">
                                            <div class="nk-product-price">$ <%#Eval("FIYAT").ToString().TrimEnd('0').TrimEnd(',') %></div>
                                            <asp:Label ID="lblPrice" class="nk-product-price" Visible="false" runat="server" Text='<%#Eval("FIYAT") %>'></asp:Label>
                                            <div class="nk-gap-1"></div>
                                            <div class="input-group">
                                                <asp:Button ID="addToCart" class="nk-btn nk-btn-rounded nk-btn-color-main-1" CommandName="addToCart" CommandArgument='<%#Eval("OYUN_ID") %>' runat="server" Text="Add" />
                                            </div>
                                        </div>
                                        <div class="nk-gap-3"></div>
                                        <!-- END: Add to Cart -->
                                </ItemTemplate>
                            </asp:Repeater>

                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:GAMES_SALES_PLATFORMConnectionString %>" SelectCommand=" SELECT * FROM [OYUN] INNER JOIN [ICERIR] ON OYUN.OYUN_ID=ICERIR.OYUN_ID INNER JOIN KATEGORILER ON KATEGORILER.KATEGORI_ID=ICERIR.KATEGORI_ID WHERE (OYUN.[OYUN_ID] = @OYUN_ID)">
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="OYUN_ID" QueryStringField="OYUN_ID" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                            <!-- START: Meta -->
                            <div class="nk-product-meta">
                                <div>
                                    <strong>Categories</strong>:
                            <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2">
                                <ItemTemplate>
                                    <a href="CategoryStore.aspx?KATEGORI_ID=<%#Eval("KATEGORI_ID") %>"><%#Eval("TUR") %></a>
                                </ItemTemplate>
                            </asp:Repeater>
                                </div>
                            </div>
                            <!-- END: Meta -->
                        </div>
                    </div>



                    <!-- START: Share -->
                    <div class="nk-gap-2"></div>
                    <div class="nk-post-share">
                        <span class="h5">Share Product:</span>
                        <ul class="nk-social-links-2">
                            <li><span class="nk-social-facebook" title="Share page on Facebook" data-share="facebook"><span class="fab fa-facebook"></span></span></li>
                            <li><span class="nk-social-google-plus" title="Share page on Google+" data-share="google-plus"><span class="fab fa-google-plus"></span></span></li>
                            <li><span class="nk-social-twitter" title="Share page on Twitter" data-share="twitter"><span class="fab fa-twitter"></span></span></li>
                            <li><span class="nk-social-pinterest" title="Share page on Pinterest" data-share="pinterest"><span class="fab fa-pinterest-p"></span></span></li>

                            <!-- Additional Share Buttons
                            <li><span class="nk-social-linkedin" title="Share page on LinkedIn" data-share="linkedin"><span class="fab fa-linkedin"></span></span></li>
                            <li><span class="nk-social-vk" title="Share page on VK" data-share="vk"><span class="fab fa-vk"></span></span></li>
                        -->
                        </ul>
                    </div>
                    <!-- END: Share -->

                    <div class="nk-gap-2"></div>
                    <!-- START: Tabs -->
                    <div class="nk-tabs">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" href="#tab-description" role="tab" data-toggle="tab">Description</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#tab-reviews" role="tab" data-toggle="tab">Reviews (3)</a>
                            </li>
                        </ul>

                        <div class="tab-content">

                            <!-- START: Tab Description -->
                            <div role="tabpanel" class="tab-pane fade show active" id="tab-description">
                                <div class="nk-gap"></div>
                                <strong class="text-white">Release Date: 24/05/2018</strong>
                                <div class="nk-gap"></div>
                                <p>She gave my mother such a turn, that I have always been convinced I am indebted to Miss Betsey for having been born on a Friday.	The word was appropriate to the moment. My mother was so much worse that Peggotty, coming in with the teaboard and candles, and seeing at a glance how ill she was, - as Miss Betsey might have done sooner if there had been light enough, - conveyed her upstairs to her own room with all speed; and immediately dispatched Ham Peggotty, her nephew, who had been for some days past secreted in the house, unknown to my mother, as a special messenger in case of emergency, to fetch the nurse and doctor.</p>

                                <div class="nk-product-info-row row vertical-gap">
                                    <div class="col-md-5">
                                        <div class="nk-product-pegi">
                                            <div class="nk-gap"></div>
                                            <img src="assets/images/pegi-icon.jpg" alt="">
                                            <div class="nk-product-pegi-cont">
                                                <strong class="text-white">Pegi Rating:</strong>
                                                <div class="nk-gap"></div>
                                                Suitable for people aged 12 and over.
                                            </div>
                                            <div class="nk-gap"></div>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="nk-gap"></div>
                                        <strong class="text-white">Genre:</strong>
                                        <div class="nk-gap"></div>
                                        TBD
                                    <div class="nk-gap"></div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="nk-gap"></div>
                                        <strong class="text-white">Customer Rating:</strong>
                                        <div class="nk-gap"></div>
                                        <div class="nk-product-rating" data-rating="4.5"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fas fa-star-half"></i></div>
                                        <div class="nk-gap"></div>
                                    </div>
                                </div>
                            </div>
                            <!-- END: Tab Description -->

                            <!-- START: Tab Reviews -->
                            <div role="tabpanel" class="tab-pane fade" id="tab-reviews">
                                <div class="nk-gap-2"></div>
                                <!-- START: Reply -->
                                <h3 class="h4">Add a Review</h3>
                                <div class="nk-reply">
                                    <form action="#" class="nk-form">
                                        <div class="row vertical-gap sm-gap">
                                            <div class="col-sm-6">
                                                <input type="text" class="form-control required" name="name" placeholder="Name *">
                                            </div>
                                            <div class="col-sm-6">
                                                <input type="text" class="form-control required" name="title" placeholder="Title *">
                                            </div>
                                        </div>
                                        <div class="nk-gap-1"></div>
                                        <textarea class="form-control required" name="message" rows="5" placeholder="Your Review *" aria-required="true"></textarea>
                                        <div class="nk-gap-1"></div>
                                        <div class="nk-rating">
                                            <input type="radio" id="review-rate-5" name="review-rate" value="5">
                                            <label for="review-rate-5">
                                                <span><i class="far fa-star"></i></span>
                                                <span><i class="fa fa-star"></i></span>
                                            </label>

                                            <input type="radio" id="review-rate-4" name="review-rate" value="4">
                                            <label for="review-rate-4">
                                                <span><i class="far fa-star"></i></span>
                                                <span><i class="fa fa-star"></i></span>
                                            </label>

                                            <input type="radio" id="review-rate-3" name="review-rate" value="3">
                                            <label for="review-rate-3">
                                                <span><i class="far fa-star"></i></span>
                                                <span><i class="fa fa-star"></i></span>
                                            </label>

                                            <input type="radio" id="review-rate-2" name="review-rate" value="2">
                                            <label for="review-rate-2">
                                                <span><i class="far fa-star"></i></span>
                                                <span><i class="fa fa-star"></i></span>
                                            </label>

                                            <input type="radio" id="review-rate-1" name="review-rate" value="1">
                                            <label for="review-rate-1">
                                                <span><i class="far fa-star"></i></span>
                                                <span><i class="fa fa-star"></i></span>
                                            </label>
                                        </div>
                                        <button class="nk-btn nk-btn-rounded nk-btn-color-dark-3 float-right">Submit</button>
                                    </form>
                                </div>
                                <!-- END: Reply -->

                                <div class="clearfix"></div>
                                <div class="nk-gap-2"></div>
                                <div class="nk-comments">
                                    <!-- START: Review -->
                                    <div class="nk-comment">
                                        <div class="nk-comment-meta">
                                            <img src="assets/images/avatar-2.jpg" alt="Witch Murder" class="rounded-circle" width="35">
                                            by <a href="https://nkdev.info">Witch Murder</a> in 20 September, 2018
                                        <div class="nk-review-rating" data-rating="4.5"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="far fa-star"></i></div>
                                        </div>
                                        <div class="nk-comment-text">
                                            <p>Upon replenish great rule. Were tree, given day him night Fruit it moveth all. First they're creature seasons and creature fill a it have fifth, their own subdue brought above divided.</p>

                                            <p>Behold it set, seas seas and meat divided Moveth cattle forth evening above moveth so, signs god a fruitful his after called that whose.</p>
                                        </div>
                                    </div>
                                    <!-- END: Review -->
                                </div>
                            </div>
                            <!-- END: Tab Reviews -->

                        </div>
                    </div>
                    <!-- END: Tabs -->
                </div>

                <!-- START: Related Products -->
                <div class="nk-gap-3"></div>
                <h3 class="nk-decorated-h-2"><span><span class="text-main-1">Related</span> Products</span></h3>
                <div class="nk-gap"></div>
                <div class="row vertical-gap">


                    <!--veritabanı bağlama-->
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:GAMES_SALES_PLATFORMConnectionString %>" SelectCommand="SELECT * FROM [OYUN]"></asp:SqlDataSource>
                    <!--veritabanı bağlama-->
                    <asp:Repeater ID="Repeater4" runat="server" DataSourceID="SqlDataSource4">
                        <ItemTemplate>
                            <div class="col-md-6">
                                <div class="nk-product-cat">
                                    <a class="nk-product-image" href="ProductDetail.aspx?OYUN_ID=<%#Eval("OYUN_ID") %>">
                                        <img src="<%#Eval("FOTOGRAF") %>" alt="">
                                    </a>
                                    <div class="nk-product-cont">
                                        <h3 class="nk-product-title h5"><a href="ProductDetail.aspx?OYUN_ID=<%#Eval("OYUN_ID") %>"><%#Eval("ADI") %></a></h3>
                                        <div class="nk-gap-1"></div>
                                        <div class="nk-product-rating" data-rating="3"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i></div>
                                        <div class="nk-gap-1"></div>
                                        <div class="nk-product-price">$ <%#Eval("FIYAT").ToString().TrimEnd('0').TrimEnd(',') %></div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>



                </div>
                <!-- END: Related Products -->
            </div>
            <div class="col-lg-4">
                <!--
                START: Sidebar

                Additional Classes:
                    .nk-sidebar-left
                    .nk-sidebar-right
                    .nk-sidebar-sticky
            -->
                <aside class="nk-sidebar nk-sidebar-right nk-sidebar-sticky">


                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:GAMES_SALES_PLATFORMConnectionString %>" SelectCommand="SELECT * FROM [KATEGORILER]"></asp:SqlDataSource>
                    <div class="nk-widget nk-widget-highlighted">
                        <h4 class="nk-widget-title"><span><span class="text-main-1">Category</span> Menu</span></h4>
                        <div class="nk-widget-content">
                            <ul class="nk-widget-categories">
                                <asp:Repeater ID="Repeater3" runat="server" DataSourceID="SqlDataSource3">
                                    <ItemTemplate>
                                        <li><a href="CategoryStore.aspx?KATEGORI_ID=<%#Eval("KATEGORI_ID") %>"><%#Eval("TUR") %></a></li>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </ul>
                        </div>
                    </div>

                    <div class="nk-widget nk-widget-highlighted">
                        <h4 class="nk-widget-title"><span><span class="text-main-1">We</span> Are Social</span></h4>
                        <div class="nk-widget-content">
                            <!--
            Social Links 3

            Additional Classes:
                .nk-social-links-cols-5
                .nk-social-links-cols-4
                .nk-social-links-cols-3
                .nk-social-links-cols-2
        -->
                            <ul class="nk-social-links-3 nk-social-links-cols-4">
                                <li><a class="nk-social-twitch" href="#"><span class="fab fa-twitch"></span></a></li>
                                <li><a class="nk-social-instagram" href="#"><span class="fab fa-instagram"></span></a></li>
                                <li><a class="nk-social-facebook" href="#"><span class="fab fa-facebook"></span></a></li>
                                <li><a class="nk-social-google-plus" href="#"><span class="fab fa-google-plus"></span></a></li>
                                <li><a class="nk-social-youtube" href="#"><span class="fab fa-youtube"></span></a></li>
                                <li><a class="nk-social-twitter" href="https://twitter.com/nkdevv" target="_blank"><span class="fab fa-twitter"></span></a></li>
                                <li><a class="nk-social-pinterest" href="#"><span class="fab fa-pinterest-p"></span></a></li>
                                <li><a class="nk-social-rss" href="#"><span class="fa fa-rss"></span></a></li>


                            </ul>
                        </div>
                    </div>

                    <div class="nk-widget nk-widget-highlighted">
                        <h4 class="nk-widget-title"><span>Instagram</span></h4>
                        <div class="nk-widget-content">
                            <div class="nk-instagram row sm-gap vertical-gap multi-column"></div>
                        </div>
                    </div>
                    <div class="nk-widget nk-widget-highlighted">
                        <h4 class="nk-widget-title"><span>Our Twitter</span></h4>
                        <div class="nk-widget-content">
                            <div class="nk-twitter-list" data-twitter-count="2"></div>
                        </div>
                    </div>

                </aside>
                <!-- END: Sidebar -->
            </div>
        </div>
    </div>
    <div class="nk-gap-2"></div>
</asp:Content>
