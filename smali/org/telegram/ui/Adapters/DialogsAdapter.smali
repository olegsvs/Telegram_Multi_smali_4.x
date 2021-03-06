.class public Lorg/telegram/ui/Adapters/DialogsAdapter;
.super Lorg/telegram/ui/Components/RecyclerListView$SelectionAdapter;
.source "DialogsAdapter.java"


# instance fields
.field private currentCount:I

.field private final dialogComparator:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator",
            "<",
            "Lorg/telegram/tgnet/TLRPC$TL_dialog;",
            ">;"
        }
    .end annotation
.end field

.field private dialogsArray:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lorg/telegram/tgnet/TLRPC$TL_dialog;",
            ">;"
        }
    .end annotation
.end field

.field private dialogsType:I

.field private mContext:Landroid/content/Context;

.field private openedDialogId:J


# direct methods
.method public constructor <init>(Landroid/content/Context;I)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "type"    # I

    .prologue
    .line 47
    invoke-direct {p0}, Lorg/telegram/ui/Components/RecyclerListView$SelectionAdapter;-><init>()V

    .line 44
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/telegram/ui/Adapters/DialogsAdapter;->dialogsArray:Ljava/util/ArrayList;

    .line 465
    new-instance v0, Lorg/telegram/ui/Adapters/DialogsAdapter$5;

    invoke-direct {v0, p0}, Lorg/telegram/ui/Adapters/DialogsAdapter$5;-><init>(Lorg/telegram/ui/Adapters/DialogsAdapter;)V

    iput-object v0, p0, Lorg/telegram/ui/Adapters/DialogsAdapter;->dialogComparator:Ljava/util/Comparator;

    .line 48
    iput-object p1, p0, Lorg/telegram/ui/Adapters/DialogsAdapter;->mContext:Landroid/content/Context;

    .line 49
    iput p2, p0, Lorg/telegram/ui/Adapters/DialogsAdapter;->dialogsType:I

    .line 50
    return-void
.end method

.method private sortDefault(Ljava/util/ArrayList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lorg/telegram/tgnet/TLRPC$TL_dialog;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 306
    .local p1, "dialogs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/telegram/tgnet/TLRPC$TL_dialog;>;"
    iget-object v0, p0, Lorg/telegram/ui/Adapters/DialogsAdapter;->dialogComparator:Ljava/util/Comparator;

    invoke-static {p1, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 307
    return-void
.end method

.method private sortUnmutedPinedOnTop(Ljava/util/ArrayList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lorg/telegram/tgnet/TLRPC$TL_dialog;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 431
    .local p1, "dialogs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/telegram/tgnet/TLRPC$TL_dialog;>;"
    new-instance v0, Lorg/telegram/ui/Adapters/DialogsAdapter$4;

    invoke-direct {v0, p0}, Lorg/telegram/ui/Adapters/DialogsAdapter$4;-><init>(Lorg/telegram/ui/Adapters/DialogsAdapter;)V

    invoke-static {p1, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 459
    return-void
.end method

.method private sortUnreadPinedOnTop(Ljava/util/ArrayList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lorg/telegram/tgnet/TLRPC$TL_dialog;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 361
    .local p1, "dialogs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/telegram/tgnet/TLRPC$TL_dialog;>;"
    new-instance v0, Lorg/telegram/ui/Adapters/DialogsAdapter$2;

    invoke-direct {v0, p0}, Lorg/telegram/ui/Adapters/DialogsAdapter$2;-><init>(Lorg/telegram/ui/Adapters/DialogsAdapter;)V

    invoke-static {p1, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 387
    return-void
.end method

.method private sortUnreadPinedOnTopUnmutedFirst(Ljava/util/ArrayList;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lorg/telegram/tgnet/TLRPC$TL_dialog;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 390
    .local p1, "dialogs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/telegram/tgnet/TLRPC$TL_dialog;>;"
    new-instance v0, Lorg/telegram/ui/Adapters/DialogsAdapter$3;

    invoke-direct {v0, p0}, Lorg/telegram/ui/Adapters/DialogsAdapter$3;-><init>(Lorg/telegram/ui/Adapters/DialogsAdapter;)V

    invoke-static {p1, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 428
    return-void
.end method

.method private sortUsersByStatusPinnedOnTop()V
    .locals 2

    .prologue
    .line 246
    invoke-static {}, Lorg/telegram/messenger/MessagesController;->getInstance()Lorg/telegram/messenger/MessagesController;

    move-result-object v0

    iget-object v0, v0, Lorg/telegram/messenger/MessagesController;->dialogsUsers:Ljava/util/ArrayList;

    new-instance v1, Lorg/telegram/ui/Adapters/DialogsAdapter$1;

    invoke-direct {v1, p0}, Lorg/telegram/ui/Adapters/DialogsAdapter$1;-><init>(Lorg/telegram/ui/Adapters/DialogsAdapter;)V

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 302
    return-void
.end method

.method private sortUsersDefault()V
    .locals 2

    .prologue
    .line 462
    invoke-static {}, Lorg/telegram/messenger/MessagesController;->getInstance()Lorg/telegram/messenger/MessagesController;

    move-result-object v0

    iget-object v0, v0, Lorg/telegram/messenger/MessagesController;->dialogsUsers:Ljava/util/ArrayList;

    iget-object v1, p0, Lorg/telegram/ui/Adapters/DialogsAdapter;->dialogComparator:Ljava/util/Comparator;

    invoke-static {v0, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 463
    return-void
.end method


# virtual methods
.method public getDialogsArray()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lorg/telegram/tgnet/TLRPC$TL_dialog;",
            ">;"
        }
    .end annotation

    .prologue
    .line 81
    iget-object v0, p0, Lorg/telegram/ui/Adapters/DialogsAdapter;->dialogsArray:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    .line 82
    iget-object v0, p0, Lorg/telegram/ui/Adapters/DialogsAdapter;->dialogsArray:Ljava/util/ArrayList;

    .line 85
    :goto_0
    return-object v0

    .line 84
    :cond_0
    invoke-virtual {p0}, Lorg/telegram/ui/Adapters/DialogsAdapter;->sortDialogs()Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lorg/telegram/ui/Adapters/DialogsAdapter;->dialogsArray:Ljava/util/ArrayList;

    .line 85
    iget-object v0, p0, Lorg/telegram/ui/Adapters/DialogsAdapter;->dialogsArray:Ljava/util/ArrayList;

    goto :goto_0
.end method

.method public getItem(I)Lorg/telegram/tgnet/TLRPC$TL_dialog;
    .locals 2
    .param p1, "i"    # I

    .prologue
    .line 524
    invoke-virtual {p0}, Lorg/telegram/ui/Adapters/DialogsAdapter;->getDialogsArray()Ljava/util/ArrayList;

    move-result-object v0

    .line 525
    .local v0, "arrayList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/telegram/tgnet/TLRPC$TL_dialog;>;"
    if-ltz p1, :cond_0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lt p1, v1, :cond_1

    .line 526
    :cond_0
    const/4 v1, 0x0

    .line 528
    :goto_0
    return-object v1

    :cond_1
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/telegram/tgnet/TLRPC$TL_dialog;

    goto :goto_0
.end method

.method public getItemCount()I
    .locals 2

    .prologue
    .line 512
    invoke-virtual {p0}, Lorg/telegram/ui/Adapters/DialogsAdapter;->getDialogsArray()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 513
    .local v0, "count":I
    if-nez v0, :cond_0

    invoke-static {}, Lorg/telegram/messenger/MessagesController;->getInstance()Lorg/telegram/messenger/MessagesController;

    move-result-object v1

    iget-boolean v1, v1, Lorg/telegram/messenger/MessagesController;->loadingDialogs:Z

    if-eqz v1, :cond_0

    .line 514
    const/4 v1, 0x0

    .line 520
    :goto_0
    return v1

    .line 516
    :cond_0
    invoke-static {}, Lorg/telegram/messenger/MessagesController;->getInstance()Lorg/telegram/messenger/MessagesController;

    move-result-object v1

    iget-boolean v1, v1, Lorg/telegram/messenger/MessagesController;->dialogsEndReached:Z

    if-nez v1, :cond_1

    .line 517
    add-int/lit8 v0, v0, 0x1

    .line 519
    :cond_1
    iput v0, p0, Lorg/telegram/ui/Adapters/DialogsAdapter;->currentCount:I

    move v1, v0

    .line 520
    goto :goto_0
.end method

.method public getItemViewType(I)I
    .locals 2
    .param p1, "i"    # I

    .prologue
    const/4 v0, 0x2

    .line 611
    invoke-virtual {p0}, Lorg/telegram/ui/Adapters/DialogsAdapter;->getDialogsArray()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ne p1, v1, :cond_1

    .line 613
    iget v1, p0, Lorg/telegram/ui/Adapters/DialogsAdapter;->dialogsType:I

    if-le v1, v0, :cond_0

    .line 617
    :goto_0
    return v0

    .line 615
    :cond_0
    const/4 v0, 0x1

    goto :goto_0

    .line 617
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isDataSetChanged()Z
    .locals 3

    .prologue
    const/4 v1, 0x1

    .line 57
    const/4 v2, 0x0

    iput-object v2, p0, Lorg/telegram/ui/Adapters/DialogsAdapter;->dialogsArray:Ljava/util/ArrayList;

    .line 58
    iget v0, p0, Lorg/telegram/ui/Adapters/DialogsAdapter;->currentCount:I

    .line 59
    .local v0, "current":I
    invoke-virtual {p0}, Lorg/telegram/ui/Adapters/DialogsAdapter;->getItemCount()I

    move-result v2

    if-ne v0, v2, :cond_0

    if-ne v0, v1, :cond_1

    :cond_0
    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public isEnabled(Lorg/telegram/messenger/support/widget/RecyclerView$ViewHolder;)Z
    .locals 2
    .param p1, "holder"    # Lorg/telegram/messenger/support/widget/RecyclerView$ViewHolder;

    .prologue
    const/4 v0, 0x1

    .line 540
    invoke-virtual {p1}, Lorg/telegram/messenger/support/widget/RecyclerView$ViewHolder;->getItemViewType()I

    move-result v1

    if-eq v1, v0, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public notifyDataSetChanged()V
    .locals 1

    .prologue
    .line 64
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/telegram/ui/Adapters/DialogsAdapter;->dialogsArray:Ljava/util/ArrayList;

    .line 66
    invoke-super {p0}, Lorg/telegram/ui/Components/RecyclerListView$SelectionAdapter;->notifyDataSetChanged()V

    .line 67
    return-void
.end method

.method public onBindViewHolder(Lorg/telegram/messenger/support/widget/RecyclerView$ViewHolder;I)V
    .locals 10
    .param p1, "viewHolder"    # Lorg/telegram/messenger/support/widget/RecyclerView$ViewHolder;
    .param p2, "i"    # I

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 591
    invoke-virtual {p1}, Lorg/telegram/messenger/support/widget/RecyclerView$ViewHolder;->getItemViewType()I

    move-result v2

    if-nez v2, :cond_4

    .line 592
    iget-object v0, p1, Lorg/telegram/messenger/support/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    check-cast v0, Lorg/telegram/ui/Cells/DialogCell;

    .line 593
    .local v0, "cell":Lorg/telegram/ui/Cells/DialogCell;
    invoke-virtual {p0}, Lorg/telegram/ui/Adapters/DialogsAdapter;->getItemCount()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    if-eq p2, v2, :cond_2

    move v2, v3

    :goto_0
    iput-boolean v2, v0, Lorg/telegram/ui/Cells/DialogCell;->useSeparator:Z

    .line 594
    invoke-virtual {p0, p2}, Lorg/telegram/ui/Adapters/DialogsAdapter;->getItem(I)Lorg/telegram/tgnet/TLRPC$TL_dialog;

    move-result-object v1

    .line 595
    .local v1, "dialog":Lorg/telegram/tgnet/TLRPC$TL_dialog;
    iget v2, p0, Lorg/telegram/ui/Adapters/DialogsAdapter;->dialogsType:I

    if-nez v2, :cond_0

    .line 596
    invoke-static {}, Lorg/telegram/messenger/AndroidUtilities;->isTablet()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 597
    iget-wide v6, v1, Lorg/telegram/tgnet/TLRPC$TL_dialog;->id:J

    iget-wide v8, p0, Lorg/telegram/ui/Adapters/DialogsAdapter;->openedDialogId:J

    cmp-long v2, v6, v8

    if-nez v2, :cond_3

    :goto_1
    invoke-virtual {v0, v3}, Lorg/telegram/ui/Cells/DialogCell;->setDialogSelected(Z)V

    .line 600
    :cond_0
    iget v2, p0, Lorg/telegram/ui/Adapters/DialogsAdapter;->dialogsType:I

    invoke-virtual {v0, v1, p2, v2}, Lorg/telegram/ui/Cells/DialogCell;->setDialog(Lorg/telegram/tgnet/TLRPC$TL_dialog;II)V

    .line 607
    .end local v0    # "cell":Lorg/telegram/ui/Cells/DialogCell;
    .end local v1    # "dialog":Lorg/telegram/tgnet/TLRPC$TL_dialog;
    :cond_1
    :goto_2
    return-void

    .restart local v0    # "cell":Lorg/telegram/ui/Cells/DialogCell;
    :cond_2
    move v2, v4

    .line 593
    goto :goto_0

    .restart local v1    # "dialog":Lorg/telegram/tgnet/TLRPC$TL_dialog;
    :cond_3
    move v3, v4

    .line 597
    goto :goto_1

    .line 603
    .end local v0    # "cell":Lorg/telegram/ui/Cells/DialogCell;
    .end local v1    # "dialog":Lorg/telegram/tgnet/TLRPC$TL_dialog;
    :cond_4
    invoke-virtual {p1}, Lorg/telegram/messenger/support/widget/RecyclerView$ViewHolder;->getItemViewType()I

    move-result v2

    if-ne v2, v3, :cond_1

    .line 604
    iget-object v2, p1, Lorg/telegram/messenger/support/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    goto :goto_2
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lorg/telegram/messenger/support/widget/RecyclerView$ViewHolder;
    .locals 6
    .param p1, "viewGroup"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v2, 0x0

    .line 545
    const/4 v0, 0x0

    .line 546
    .local v0, "view":Landroid/view/View;
    if-nez p2, :cond_2

    .line 547
    new-instance v0, Lorg/telegram/ui/Cells/DialogCell;

    .end local v0    # "view":Landroid/view/View;
    iget-object v1, p0, Lorg/telegram/ui/Adapters/DialogsAdapter;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lorg/telegram/ui/Cells/DialogCell;-><init>(Landroid/content/Context;)V

    .line 557
    .restart local v0    # "view":Landroid/view/View;
    :cond_0
    :goto_0
    new-instance v1, Lorg/telegram/messenger/support/widget/RecyclerView$LayoutParams;

    const/4 v2, -0x1

    const/4 v3, -0x2

    invoke-direct {v1, v2, v3}, Lorg/telegram/messenger/support/widget/RecyclerView$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 559
    iget v1, p0, Lorg/telegram/ui/Adapters/DialogsAdapter;->dialogsType:I

    if-le v1, v5, :cond_1

    if-ne p2, v4, :cond_1

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 586
    :cond_1
    new-instance v1, Lorg/telegram/ui/Components/RecyclerListView$Holder;

    invoke-direct {v1, v0}, Lorg/telegram/ui/Components/RecyclerListView$Holder;-><init>(Landroid/view/View;)V

    return-object v1

    .line 548
    :cond_2
    if-ne p2, v4, :cond_3

    .line 549
    new-instance v0, Lorg/telegram/ui/Cells/LoadingCell;

    .end local v0    # "view":Landroid/view/View;
    iget-object v1, p0, Lorg/telegram/ui/Adapters/DialogsAdapter;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Lorg/telegram/ui/Cells/LoadingCell;-><init>(Landroid/content/Context;)V

    .restart local v0    # "view":Landroid/view/View;
    goto :goto_0

    .line 552
    :cond_3
    if-ne p2, v5, :cond_0

    .line 553
    new-instance v0, Landroid/view/View;

    .end local v0    # "view":Landroid/view/View;
    iget-object v1, p0, Lorg/telegram/ui/Adapters/DialogsAdapter;->mContext:Landroid/content/Context;

    invoke-direct {v0, v1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 554
    .restart local v0    # "view":Landroid/view/View;
    new-instance v1, Lorg/telegram/messenger/support/widget/RecyclerView$LayoutParams;

    invoke-direct {v1, v2, v2}, Lorg/telegram/messenger/support/widget/RecyclerView$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    goto :goto_0
.end method

.method public onViewAttachedToWindow(Lorg/telegram/messenger/support/widget/RecyclerView$ViewHolder;)V
    .locals 1
    .param p1, "holder"    # Lorg/telegram/messenger/support/widget/RecyclerView$ViewHolder;

    .prologue
    .line 533
    iget-object v0, p1, Lorg/telegram/messenger/support/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    instance-of v0, v0, Lorg/telegram/ui/Cells/DialogCell;

    if-eqz v0, :cond_0

    .line 534
    iget-object v0, p1, Lorg/telegram/messenger/support/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    check-cast v0, Lorg/telegram/ui/Cells/DialogCell;

    invoke-virtual {v0}, Lorg/telegram/ui/Cells/DialogCell;->checkCurrentDialogIndex()V

    .line 536
    :cond_0
    return-void
.end method

.method public setDialogsType(I)V
    .locals 0
    .param p1, "type"    # I

    .prologue
    .line 191
    iput p1, p0, Lorg/telegram/ui/Adapters/DialogsAdapter;->dialogsType:I

    .line 192
    return-void
.end method

.method public setOpenedDialogId(J)V
    .locals 1
    .param p1, "id"    # J

    .prologue
    .line 53
    iput-wide p1, p0, Lorg/telegram/ui/Adapters/DialogsAdapter;->openedDialogId:J

    .line 54
    return-void
.end method

.method public sort()V
    .locals 0

    .prologue
    .line 195
    invoke-virtual {p0}, Lorg/telegram/ui/Adapters/DialogsAdapter;->getDialogsArray()Ljava/util/ArrayList;

    .line 196
    invoke-virtual {p0}, Lorg/telegram/ui/Adapters/DialogsAdapter;->notifyDataSetChanged()V

    .line 197
    return-void
.end method

.method public sortDialogs()Ljava/util/ArrayList;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lorg/telegram/tgnet/TLRPC$TL_dialog;",
            ">;"
        }
    .end annotation

    .prologue
    .line 91
    iget v0, p0, Lorg/telegram/ui/Adapters/DialogsAdapter;->dialogsType:I

    packed-switch v0, :pswitch_data_0

    .line 180
    sget v0, Lorg/telegram/ui/ActionBar/Theme;->plusSortAll:I

    if-eqz v0, :cond_0

    sget-boolean v0, Lorg/telegram/ui/ActionBar/Theme;->plusHideTabs:Z

    if-eqz v0, :cond_d

    .line 181
    :cond_0
    invoke-static {}, Lorg/telegram/messenger/MessagesController;->getInstance()Lorg/telegram/messenger/MessagesController;

    move-result-object v0

    iget-object v0, v0, Lorg/telegram/messenger/MessagesController;->dialogs:Ljava/util/ArrayList;

    invoke-direct {p0, v0}, Lorg/telegram/ui/Adapters/DialogsAdapter;->sortDefault(Ljava/util/ArrayList;)V

    .line 186
    :goto_0
    invoke-static {}, Lorg/telegram/messenger/MessagesController;->getInstance()Lorg/telegram/messenger/MessagesController;

    move-result-object v0

    iget-object v0, v0, Lorg/telegram/messenger/MessagesController;->dialogs:Ljava/util/ArrayList;

    :goto_1
    return-object v0

    .line 93
    :pswitch_0
    sget v0, Lorg/telegram/ui/ActionBar/Theme;->plusSortAll:I

    if-eqz v0, :cond_1

    sget-boolean v0, Lorg/telegram/ui/ActionBar/Theme;->plusHideTabs:Z

    if-eqz v0, :cond_2

    .line 94
    :cond_1
    invoke-static {}, Lorg/telegram/messenger/MessagesController;->getInstance()Lorg/telegram/messenger/MessagesController;

    move-result-object v0

    iget-object v0, v0, Lorg/telegram/messenger/MessagesController;->dialogs:Ljava/util/ArrayList;

    invoke-direct {p0, v0}, Lorg/telegram/ui/Adapters/DialogsAdapter;->sortDefault(Ljava/util/ArrayList;)V

    .line 99
    :goto_2
    invoke-static {}, Lorg/telegram/messenger/MessagesController;->getInstance()Lorg/telegram/messenger/MessagesController;

    move-result-object v0

    iget-object v0, v0, Lorg/telegram/messenger/MessagesController;->dialogs:Ljava/util/ArrayList;

    goto :goto_1

    .line 97
    :cond_2
    invoke-static {}, Lorg/telegram/messenger/MessagesController;->getInstance()Lorg/telegram/messenger/MessagesController;

    move-result-object v0

    iget-object v0, v0, Lorg/telegram/messenger/MessagesController;->dialogs:Ljava/util/ArrayList;

    invoke-direct {p0, v0}, Lorg/telegram/ui/Adapters/DialogsAdapter;->sortUnreadPinedOnTop(Ljava/util/ArrayList;)V

    goto :goto_2

    .line 101
    :pswitch_1
    invoke-static {}, Lorg/telegram/messenger/MessagesController;->getInstance()Lorg/telegram/messenger/MessagesController;

    move-result-object v0

    iget-object v0, v0, Lorg/telegram/messenger/MessagesController;->dialogsServerOnly:Ljava/util/ArrayList;

    goto :goto_1

    .line 103
    :pswitch_2
    invoke-static {}, Lorg/telegram/messenger/MessagesController;->getInstance()Lorg/telegram/messenger/MessagesController;

    move-result-object v0

    iget-object v0, v0, Lorg/telegram/messenger/MessagesController;->dialogsGroupsOnly:Ljava/util/ArrayList;

    goto :goto_1

    .line 105
    :pswitch_3
    sget v0, Lorg/telegram/ui/ActionBar/Theme;->plusSortUsers:I

    if-nez v0, :cond_3

    .line 106
    invoke-direct {p0}, Lorg/telegram/ui/Adapters/DialogsAdapter;->sortUsersDefault()V

    .line 111
    :goto_3
    invoke-static {}, Lorg/telegram/messenger/MessagesController;->getInstance()Lorg/telegram/messenger/MessagesController;

    move-result-object v0

    iget-object v0, v0, Lorg/telegram/messenger/MessagesController;->dialogsUsers:Ljava/util/ArrayList;

    goto :goto_1

    .line 109
    :cond_3
    invoke-direct {p0}, Lorg/telegram/ui/Adapters/DialogsAdapter;->sortUsersByStatusPinnedOnTop()V

    goto :goto_3

    .line 113
    :pswitch_4
    sget v0, Lorg/telegram/ui/ActionBar/Theme;->plusSortGroups:I

    if-nez v0, :cond_4

    .line 114
    invoke-static {}, Lorg/telegram/messenger/MessagesController;->getInstance()Lorg/telegram/messenger/MessagesController;

    move-result-object v0

    iget-object v0, v0, Lorg/telegram/messenger/MessagesController;->dialogsGroups:Ljava/util/ArrayList;

    invoke-direct {p0, v0}, Lorg/telegram/ui/Adapters/DialogsAdapter;->sortDefault(Ljava/util/ArrayList;)V

    .line 119
    :goto_4
    invoke-static {}, Lorg/telegram/messenger/MessagesController;->getInstance()Lorg/telegram/messenger/MessagesController;

    move-result-object v0

    iget-object v0, v0, Lorg/telegram/messenger/MessagesController;->dialogsGroups:Ljava/util/ArrayList;

    goto :goto_1

    .line 117
    :cond_4
    invoke-static {}, Lorg/telegram/messenger/MessagesController;->getInstance()Lorg/telegram/messenger/MessagesController;

    move-result-object v0

    iget-object v0, v0, Lorg/telegram/messenger/MessagesController;->dialogsGroups:Ljava/util/ArrayList;

    invoke-direct {p0, v0}, Lorg/telegram/ui/Adapters/DialogsAdapter;->sortUnreadPinedOnTop(Ljava/util/ArrayList;)V

    goto :goto_4

    .line 121
    :pswitch_5
    sget v0, Lorg/telegram/ui/ActionBar/Theme;->plusSortChannels:I

    if-nez v0, :cond_5

    .line 122
    invoke-static {}, Lorg/telegram/messenger/MessagesController;->getInstance()Lorg/telegram/messenger/MessagesController;

    move-result-object v0

    iget-object v0, v0, Lorg/telegram/messenger/MessagesController;->dialogsChannels:Ljava/util/ArrayList;

    invoke-direct {p0, v0}, Lorg/telegram/ui/Adapters/DialogsAdapter;->sortDefault(Ljava/util/ArrayList;)V

    .line 127
    :goto_5
    invoke-static {}, Lorg/telegram/messenger/MessagesController;->getInstance()Lorg/telegram/messenger/MessagesController;

    move-result-object v0

    iget-object v0, v0, Lorg/telegram/messenger/MessagesController;->dialogsChannels:Ljava/util/ArrayList;

    goto :goto_1

    .line 125
    :cond_5
    invoke-static {}, Lorg/telegram/messenger/MessagesController;->getInstance()Lorg/telegram/messenger/MessagesController;

    move-result-object v0

    iget-object v0, v0, Lorg/telegram/messenger/MessagesController;->dialogsChannels:Ljava/util/ArrayList;

    invoke-direct {p0, v0}, Lorg/telegram/ui/Adapters/DialogsAdapter;->sortUnreadPinedOnTop(Ljava/util/ArrayList;)V

    goto :goto_5

    .line 129
    :pswitch_6
    sget v0, Lorg/telegram/ui/ActionBar/Theme;->plusSortBots:I

    if-nez v0, :cond_6

    .line 130
    invoke-static {}, Lorg/telegram/messenger/MessagesController;->getInstance()Lorg/telegram/messenger/MessagesController;

    move-result-object v0

    iget-object v0, v0, Lorg/telegram/messenger/MessagesController;->dialogsBots:Ljava/util/ArrayList;

    invoke-direct {p0, v0}, Lorg/telegram/ui/Adapters/DialogsAdapter;->sortDefault(Ljava/util/ArrayList;)V

    .line 135
    :goto_6
    invoke-static {}, Lorg/telegram/messenger/MessagesController;->getInstance()Lorg/telegram/messenger/MessagesController;

    move-result-object v0

    iget-object v0, v0, Lorg/telegram/messenger/MessagesController;->dialogsBots:Ljava/util/ArrayList;

    goto/16 :goto_1

    .line 133
    :cond_6
    invoke-static {}, Lorg/telegram/messenger/MessagesController;->getInstance()Lorg/telegram/messenger/MessagesController;

    move-result-object v0

    iget-object v0, v0, Lorg/telegram/messenger/MessagesController;->dialogsBots:Ljava/util/ArrayList;

    invoke-direct {p0, v0}, Lorg/telegram/ui/Adapters/DialogsAdapter;->sortUnreadPinedOnTop(Ljava/util/ArrayList;)V

    goto :goto_6

    .line 137
    :pswitch_7
    sget v0, Lorg/telegram/ui/ActionBar/Theme;->plusSortSuperGroups:I

    if-nez v0, :cond_7

    .line 138
    invoke-static {}, Lorg/telegram/messenger/MessagesController;->getInstance()Lorg/telegram/messenger/MessagesController;

    move-result-object v0

    iget-object v0, v0, Lorg/telegram/messenger/MessagesController;->dialogsMegaGroups:Ljava/util/ArrayList;

    invoke-direct {p0, v0}, Lorg/telegram/ui/Adapters/DialogsAdapter;->sortDefault(Ljava/util/ArrayList;)V

    .line 143
    :goto_7
    invoke-static {}, Lorg/telegram/messenger/MessagesController;->getInstance()Lorg/telegram/messenger/MessagesController;

    move-result-object v0

    iget-object v0, v0, Lorg/telegram/messenger/MessagesController;->dialogsMegaGroups:Ljava/util/ArrayList;

    goto/16 :goto_1

    .line 141
    :cond_7
    invoke-static {}, Lorg/telegram/messenger/MessagesController;->getInstance()Lorg/telegram/messenger/MessagesController;

    move-result-object v0

    iget-object v0, v0, Lorg/telegram/messenger/MessagesController;->dialogsMegaGroups:Ljava/util/ArrayList;

    invoke-direct {p0, v0}, Lorg/telegram/ui/Adapters/DialogsAdapter;->sortUnreadPinedOnTop(Ljava/util/ArrayList;)V

    goto :goto_7

    .line 145
    :pswitch_8
    sget v0, Lorg/telegram/ui/ActionBar/Theme;->plusSortFavs:I

    if-nez v0, :cond_8

    .line 146
    invoke-static {}, Lorg/telegram/messenger/MessagesController;->getInstance()Lorg/telegram/messenger/MessagesController;

    move-result-object v0

    iget-object v0, v0, Lorg/telegram/messenger/MessagesController;->dialogsFavs:Ljava/util/ArrayList;

    invoke-direct {p0, v0}, Lorg/telegram/ui/Adapters/DialogsAdapter;->sortDefault(Ljava/util/ArrayList;)V

    .line 151
    :goto_8
    invoke-static {}, Lorg/telegram/messenger/MessagesController;->getInstance()Lorg/telegram/messenger/MessagesController;

    move-result-object v0

    iget-object v0, v0, Lorg/telegram/messenger/MessagesController;->dialogsFavs:Ljava/util/ArrayList;

    goto/16 :goto_1

    .line 149
    :cond_8
    invoke-static {}, Lorg/telegram/messenger/MessagesController;->getInstance()Lorg/telegram/messenger/MessagesController;

    move-result-object v0

    iget-object v0, v0, Lorg/telegram/messenger/MessagesController;->dialogsFavs:Ljava/util/ArrayList;

    invoke-direct {p0, v0}, Lorg/telegram/ui/Adapters/DialogsAdapter;->sortUnreadPinedOnTop(Ljava/util/ArrayList;)V

    goto :goto_8

    .line 153
    :pswitch_9
    sget v0, Lorg/telegram/ui/ActionBar/Theme;->plusSortGroups:I

    if-nez v0, :cond_9

    .line 154
    invoke-static {}, Lorg/telegram/messenger/MessagesController;->getInstance()Lorg/telegram/messenger/MessagesController;

    move-result-object v0

    iget-object v0, v0, Lorg/telegram/messenger/MessagesController;->dialogsGroupsAll:Ljava/util/ArrayList;

    invoke-direct {p0, v0}, Lorg/telegram/ui/Adapters/DialogsAdapter;->sortDefault(Ljava/util/ArrayList;)V

    .line 159
    :goto_9
    invoke-static {}, Lorg/telegram/messenger/MessagesController;->getInstance()Lorg/telegram/messenger/MessagesController;

    move-result-object v0

    iget-object v0, v0, Lorg/telegram/messenger/MessagesController;->dialogsGroupsAll:Ljava/util/ArrayList;

    goto/16 :goto_1

    .line 157
    :cond_9
    invoke-static {}, Lorg/telegram/messenger/MessagesController;->getInstance()Lorg/telegram/messenger/MessagesController;

    move-result-object v0

    iget-object v0, v0, Lorg/telegram/messenger/MessagesController;->dialogsGroupsAll:Ljava/util/ArrayList;

    invoke-direct {p0, v0}, Lorg/telegram/ui/Adapters/DialogsAdapter;->sortUnreadPinedOnTop(Ljava/util/ArrayList;)V

    goto :goto_9

    .line 161
    :pswitch_a
    sget v0, Lorg/telegram/ui/ActionBar/Theme;->plusSortAdmin:I

    if-nez v0, :cond_a

    .line 162
    invoke-static {}, Lorg/telegram/messenger/MessagesController;->getInstance()Lorg/telegram/messenger/MessagesController;

    move-result-object v0

    iget-object v0, v0, Lorg/telegram/messenger/MessagesController;->dialogsAdmin:Ljava/util/ArrayList;

    invoke-direct {p0, v0}, Lorg/telegram/ui/Adapters/DialogsAdapter;->sortDefault(Ljava/util/ArrayList;)V

    .line 166
    :goto_a
    invoke-static {}, Lorg/telegram/messenger/MessagesController;->getInstance()Lorg/telegram/messenger/MessagesController;

    move-result-object v0

    iget-object v0, v0, Lorg/telegram/messenger/MessagesController;->dialogsAdmin:Ljava/util/ArrayList;

    goto/16 :goto_1

    .line 164
    :cond_a
    invoke-static {}, Lorg/telegram/messenger/MessagesController;->getInstance()Lorg/telegram/messenger/MessagesController;

    move-result-object v0

    iget-object v0, v0, Lorg/telegram/messenger/MessagesController;->dialogsAdmin:Ljava/util/ArrayList;

    invoke-direct {p0, v0}, Lorg/telegram/ui/Adapters/DialogsAdapter;->sortUnreadPinedOnTop(Ljava/util/ArrayList;)V

    goto :goto_a

    .line 168
    :pswitch_b
    sget v0, Lorg/telegram/ui/ActionBar/Theme;->plusSortUnread:I

    if-nez v0, :cond_b

    .line 170
    invoke-static {}, Lorg/telegram/messenger/MessagesController;->getInstance()Lorg/telegram/messenger/MessagesController;

    move-result-object v0

    iget-object v0, v0, Lorg/telegram/messenger/MessagesController;->dialogsUnread:Ljava/util/ArrayList;

    invoke-direct {p0, v0}, Lorg/telegram/ui/Adapters/DialogsAdapter;->sortDefault(Ljava/util/ArrayList;)V

    .line 178
    :goto_b
    invoke-static {}, Lorg/telegram/messenger/MessagesController;->getInstance()Lorg/telegram/messenger/MessagesController;

    move-result-object v0

    iget-object v0, v0, Lorg/telegram/messenger/MessagesController;->dialogsUnread:Ljava/util/ArrayList;

    goto/16 :goto_1

    .line 172
    :cond_b
    sget v0, Lorg/telegram/ui/ActionBar/Theme;->plusSortUnread:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_c

    .line 173
    invoke-static {}, Lorg/telegram/messenger/MessagesController;->getInstance()Lorg/telegram/messenger/MessagesController;

    move-result-object v0

    iget-object v0, v0, Lorg/telegram/messenger/MessagesController;->dialogsUnread:Ljava/util/ArrayList;

    invoke-direct {p0, v0}, Lorg/telegram/ui/Adapters/DialogsAdapter;->sortUnreadPinedOnTopUnmutedFirst(Ljava/util/ArrayList;)V

    goto :goto_b

    .line 175
    :cond_c
    invoke-static {}, Lorg/telegram/messenger/MessagesController;->getInstance()Lorg/telegram/messenger/MessagesController;

    move-result-object v0

    iget-object v0, v0, Lorg/telegram/messenger/MessagesController;->dialogsUnread:Ljava/util/ArrayList;

    invoke-direct {p0, v0}, Lorg/telegram/ui/Adapters/DialogsAdapter;->sortUnreadPinedOnTop(Ljava/util/ArrayList;)V

    goto :goto_b

    .line 184
    :cond_d
    invoke-static {}, Lorg/telegram/messenger/MessagesController;->getInstance()Lorg/telegram/messenger/MessagesController;

    move-result-object v0

    iget-object v0, v0, Lorg/telegram/messenger/MessagesController;->dialogs:Ljava/util/ArrayList;

    invoke-direct {p0, v0}, Lorg/telegram/ui/Adapters/DialogsAdapter;->sortUnreadPinedOnTop(Ljava/util/ArrayList;)V

    goto/16 :goto_0

    .line 91
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_a
        :pswitch_b
    .end packed-switch
.end method
