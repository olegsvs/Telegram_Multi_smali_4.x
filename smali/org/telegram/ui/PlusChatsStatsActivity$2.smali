.class Lorg/telegram/ui/PlusChatsStatsActivity$2;
.super Ljava/lang/Object;
.source "PlusChatsStatsActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/telegram/ui/PlusChatsStatsActivity;->loadAdminChats()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/telegram/ui/PlusChatsStatsActivity;


# direct methods
.method constructor <init>(Lorg/telegram/ui/PlusChatsStatsActivity;)V
    .locals 0
    .param p1, "this$0"    # Lorg/telegram/ui/PlusChatsStatsActivity;

    .prologue
    .line 236
    iput-object p1, p0, Lorg/telegram/ui/PlusChatsStatsActivity$2;->this$0:Lorg/telegram/ui/PlusChatsStatsActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

    .prologue
    .line 239
    iget-object v6, p0, Lorg/telegram/ui/PlusChatsStatsActivity$2;->this$0:Lorg/telegram/ui/PlusChatsStatsActivity;

    invoke-static {v6}, Lorg/telegram/ui/PlusChatsStatsActivity;->access$200(Lorg/telegram/ui/PlusChatsStatsActivity;)I

    move-result v6

    iget-object v7, p0, Lorg/telegram/ui/PlusChatsStatsActivity$2;->this$0:Lorg/telegram/ui/PlusChatsStatsActivity;

    invoke-static {v7}, Lorg/telegram/ui/PlusChatsStatsActivity;->access$300(Lorg/telegram/ui/PlusChatsStatsActivity;)I

    move-result v7

    if-gt v6, v7, :cond_7

    .line 240
    iget-object v6, p0, Lorg/telegram/ui/PlusChatsStatsActivity$2;->this$0:Lorg/telegram/ui/PlusChatsStatsActivity;

    invoke-static {v6}, Lorg/telegram/ui/PlusChatsStatsActivity;->access$400(Lorg/telegram/ui/PlusChatsStatsActivity;)Ljava/util/ArrayList;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/ArrayList;->clear()V

    .line 241
    invoke-static {}, Lorg/telegram/messenger/MessagesController;->getInstance()Lorg/telegram/messenger/MessagesController;

    move-result-object v6

    iget-object v6, v6, Lorg/telegram/messenger/MessagesController;->dialogsSecrets:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->clear()V

    .line 242
    invoke-static {}, Lorg/telegram/messenger/MessagesController;->getInstance()Lorg/telegram/messenger/MessagesController;

    move-result-object v6

    iget-object v6, v6, Lorg/telegram/messenger/MessagesController;->dialogsOwnGroups:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->clear()V

    .line 243
    invoke-static {}, Lorg/telegram/messenger/MessagesController;->getInstance()Lorg/telegram/messenger/MessagesController;

    move-result-object v6

    iget-object v6, v6, Lorg/telegram/messenger/MessagesController;->dialogsOwnSuperGroups:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->clear()V

    .line 244
    invoke-static {}, Lorg/telegram/messenger/MessagesController;->getInstance()Lorg/telegram/messenger/MessagesController;

    move-result-object v6

    iget-object v6, v6, Lorg/telegram/messenger/MessagesController;->dialogsOwnChannels:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->clear()V

    .line 245
    invoke-static {}, Lorg/telegram/messenger/MessagesController;->getInstance()Lorg/telegram/messenger/MessagesController;

    move-result-object v6

    iget-object v6, v6, Lorg/telegram/messenger/MessagesController;->dialogsAdminGroups:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->clear()V

    .line 246
    invoke-static {}, Lorg/telegram/messenger/MessagesController;->getInstance()Lorg/telegram/messenger/MessagesController;

    move-result-object v6

    iget-object v6, v6, Lorg/telegram/messenger/MessagesController;->dialogsAdminSuperGroups:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->clear()V

    .line 247
    invoke-static {}, Lorg/telegram/messenger/MessagesController;->getInstance()Lorg/telegram/messenger/MessagesController;

    move-result-object v6

    iget-object v6, v6, Lorg/telegram/messenger/MessagesController;->dialogsAdminChannels:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->clear()V

    .line 248
    const/4 v0, 0x0

    .local v0, "a":I
    :goto_0
    invoke-static {}, Lorg/telegram/messenger/MessagesController;->getInstance()Lorg/telegram/messenger/MessagesController;

    move-result-object v6

    iget-object v6, v6, Lorg/telegram/messenger/MessagesController;->dialogs:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ge v0, v6, :cond_7

    .line 249
    invoke-static {}, Lorg/telegram/messenger/MessagesController;->getInstance()Lorg/telegram/messenger/MessagesController;

    move-result-object v6

    iget-object v6, v6, Lorg/telegram/messenger/MessagesController;->dialogs:Ljava/util/ArrayList;

    invoke-virtual {v6, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/telegram/tgnet/TLRPC$TL_dialog;

    .line 250
    .local v2, "d":Lorg/telegram/tgnet/TLRPC$TL_dialog;
    iget-wide v6, v2, Lorg/telegram/tgnet/TLRPC$TL_dialog;->id:J

    const/16 v8, 0x20

    shr-long/2addr v6, v8

    long-to-int v4, v6

    .line 251
    .local v4, "high_id":I
    iget-wide v6, v2, Lorg/telegram/tgnet/TLRPC$TL_dialog;->id:J

    long-to-int v5, v6

    .line 252
    .local v5, "lower_id":I
    if-eqz v5, :cond_6

    const/4 v6, 0x1

    if-eq v4, v6, :cond_6

    .line 253
    invoke-static {v2}, Lorg/telegram/messenger/DialogObject;->isChannel(Lorg/telegram/tgnet/TLRPC$TL_dialog;)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 254
    invoke-static {}, Lorg/telegram/messenger/MessagesController;->getInstance()Lorg/telegram/messenger/MessagesController;

    move-result-object v6

    neg-int v7, v5

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v6, v7}, Lorg/telegram/messenger/MessagesController;->getChat(Ljava/lang/Integer;)Lorg/telegram/tgnet/TLRPC$Chat;

    move-result-object v1

    .line 255
    .local v1, "chat":Lorg/telegram/tgnet/TLRPC$Chat;
    if-eqz v1, :cond_0

    .line 256
    iget-boolean v6, v1, Lorg/telegram/tgnet/TLRPC$Chat;->megagroup:Z

    if-eqz v6, :cond_2

    .line 257
    iget-boolean v6, v1, Lorg/telegram/tgnet/TLRPC$Chat;->creator:Z

    if-eqz v6, :cond_1

    .line 258
    invoke-static {}, Lorg/telegram/messenger/MessagesController;->getInstance()Lorg/telegram/messenger/MessagesController;

    move-result-object v6

    iget-object v6, v6, Lorg/telegram/messenger/MessagesController;->dialogsOwnSuperGroups:Ljava/util/ArrayList;

    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 248
    .end local v1    # "chat":Lorg/telegram/tgnet/TLRPC$Chat;
    :cond_0
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 260
    .restart local v1    # "chat":Lorg/telegram/tgnet/TLRPC$Chat;
    :cond_1
    invoke-static {v1}, Lorg/telegram/messenger/ChatObject;->hasAdminRights(Lorg/telegram/tgnet/TLRPC$Chat;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 261
    invoke-static {}, Lorg/telegram/messenger/MessagesController;->getInstance()Lorg/telegram/messenger/MessagesController;

    move-result-object v6

    iget-object v6, v6, Lorg/telegram/messenger/MessagesController;->dialogsAdminSuperGroups:Ljava/util/ArrayList;

    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 265
    :cond_2
    iget-boolean v6, v1, Lorg/telegram/tgnet/TLRPC$Chat;->creator:Z

    if-eqz v6, :cond_3

    .line 266
    invoke-static {}, Lorg/telegram/messenger/MessagesController;->getInstance()Lorg/telegram/messenger/MessagesController;

    move-result-object v6

    iget-object v6, v6, Lorg/telegram/messenger/MessagesController;->dialogsOwnChannels:Ljava/util/ArrayList;

    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 268
    :cond_3
    invoke-static {v1}, Lorg/telegram/messenger/ChatObject;->hasAdminRights(Lorg/telegram/tgnet/TLRPC$Chat;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 269
    invoke-static {}, Lorg/telegram/messenger/MessagesController;->getInstance()Lorg/telegram/messenger/MessagesController;

    move-result-object v6

    iget-object v6, v6, Lorg/telegram/messenger/MessagesController;->dialogsAdminChannels:Ljava/util/ArrayList;

    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 274
    .end local v1    # "chat":Lorg/telegram/tgnet/TLRPC$Chat;
    :cond_4
    if-gez v5, :cond_0

    .line 275
    invoke-static {}, Lorg/telegram/messenger/MessagesController;->getInstance()Lorg/telegram/messenger/MessagesController;

    move-result-object v6

    neg-int v7, v5

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v6, v7}, Lorg/telegram/messenger/MessagesController;->getChat(Ljava/lang/Integer;)Lorg/telegram/tgnet/TLRPC$Chat;

    move-result-object v1

    .line 276
    .restart local v1    # "chat":Lorg/telegram/tgnet/TLRPC$Chat;
    if-eqz v1, :cond_0

    .line 277
    iget-boolean v6, v1, Lorg/telegram/tgnet/TLRPC$Chat;->creator:Z

    if-eqz v6, :cond_5

    .line 278
    invoke-static {}, Lorg/telegram/messenger/MessagesController;->getInstance()Lorg/telegram/messenger/MessagesController;

    move-result-object v6

    iget-object v6, v6, Lorg/telegram/messenger/MessagesController;->dialogsOwnGroups:Ljava/util/ArrayList;

    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 280
    :cond_5
    iget-boolean v6, v1, Lorg/telegram/tgnet/TLRPC$Chat;->admins_enabled:Z

    if-eqz v6, :cond_0

    iget-boolean v6, v1, Lorg/telegram/tgnet/TLRPC$Chat;->admin:Z

    if-eqz v6, :cond_0

    .line 281
    invoke-static {}, Lorg/telegram/messenger/MessagesController;->getInstance()Lorg/telegram/messenger/MessagesController;

    move-result-object v6

    iget-object v6, v6, Lorg/telegram/messenger/MessagesController;->dialogsAdminGroups:Ljava/util/ArrayList;

    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 296
    .end local v1    # "chat":Lorg/telegram/tgnet/TLRPC$Chat;
    :cond_6
    invoke-static {}, Lorg/telegram/messenger/MessagesController;->getInstance()Lorg/telegram/messenger/MessagesController;

    move-result-object v6

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v6, v7}, Lorg/telegram/messenger/MessagesController;->getEncryptedChat(Ljava/lang/Integer;)Lorg/telegram/tgnet/TLRPC$EncryptedChat;

    move-result-object v3

    .line 298
    .local v3, "encryptedChat":Lorg/telegram/tgnet/TLRPC$EncryptedChat;
    if-eqz v3, :cond_0

    .line 299
    invoke-static {}, Lorg/telegram/messenger/MessagesController;->getInstance()Lorg/telegram/messenger/MessagesController;

    move-result-object v6

    iget-object v6, v6, Lorg/telegram/messenger/MessagesController;->dialogsSecrets:Ljava/util/ArrayList;

    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 304
    .end local v0    # "a":I
    .end local v2    # "d":Lorg/telegram/tgnet/TLRPC$TL_dialog;
    .end local v3    # "encryptedChat":Lorg/telegram/tgnet/TLRPC$EncryptedChat;
    .end local v4    # "high_id":I
    .end local v5    # "lower_id":I
    :cond_7
    iget-object v6, p0, Lorg/telegram/ui/PlusChatsStatsActivity$2;->this$0:Lorg/telegram/ui/PlusChatsStatsActivity;

    invoke-static {}, Lorg/telegram/messenger/MessagesController;->getInstance()Lorg/telegram/messenger/MessagesController;

    move-result-object v7

    iget-object v7, v7, Lorg/telegram/messenger/MessagesController;->dialogsSecrets:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    invoke-static {v6, v7}, Lorg/telegram/ui/PlusChatsStatsActivity;->access$502(Lorg/telegram/ui/PlusChatsStatsActivity;I)I

    .line 305
    iget-object v6, p0, Lorg/telegram/ui/PlusChatsStatsActivity$2;->this$0:Lorg/telegram/ui/PlusChatsStatsActivity;

    invoke-static {}, Lorg/telegram/messenger/MessagesController;->getInstance()Lorg/telegram/messenger/MessagesController;

    move-result-object v7

    iget-object v7, v7, Lorg/telegram/messenger/MessagesController;->dialogsOwnGroups:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    invoke-static {v6, v7}, Lorg/telegram/ui/PlusChatsStatsActivity;->access$602(Lorg/telegram/ui/PlusChatsStatsActivity;I)I

    .line 306
    iget-object v6, p0, Lorg/telegram/ui/PlusChatsStatsActivity$2;->this$0:Lorg/telegram/ui/PlusChatsStatsActivity;

    invoke-static {}, Lorg/telegram/messenger/MessagesController;->getInstance()Lorg/telegram/messenger/MessagesController;

    move-result-object v7

    iget-object v7, v7, Lorg/telegram/messenger/MessagesController;->dialogsOwnSuperGroups:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    invoke-static {v6, v7}, Lorg/telegram/ui/PlusChatsStatsActivity;->access$702(Lorg/telegram/ui/PlusChatsStatsActivity;I)I

    .line 307
    iget-object v6, p0, Lorg/telegram/ui/PlusChatsStatsActivity$2;->this$0:Lorg/telegram/ui/PlusChatsStatsActivity;

    invoke-static {}, Lorg/telegram/messenger/MessagesController;->getInstance()Lorg/telegram/messenger/MessagesController;

    move-result-object v7

    iget-object v7, v7, Lorg/telegram/messenger/MessagesController;->dialogsOwnChannels:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    invoke-static {v6, v7}, Lorg/telegram/ui/PlusChatsStatsActivity;->access$802(Lorg/telegram/ui/PlusChatsStatsActivity;I)I

    .line 309
    iget-object v6, p0, Lorg/telegram/ui/PlusChatsStatsActivity$2;->this$0:Lorg/telegram/ui/PlusChatsStatsActivity;

    invoke-static {}, Lorg/telegram/messenger/MessagesController;->getInstance()Lorg/telegram/messenger/MessagesController;

    move-result-object v7

    iget-object v7, v7, Lorg/telegram/messenger/MessagesController;->dialogsAdminGroups:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    invoke-static {v6, v7}, Lorg/telegram/ui/PlusChatsStatsActivity;->access$902(Lorg/telegram/ui/PlusChatsStatsActivity;I)I

    .line 310
    iget-object v6, p0, Lorg/telegram/ui/PlusChatsStatsActivity$2;->this$0:Lorg/telegram/ui/PlusChatsStatsActivity;

    invoke-static {}, Lorg/telegram/messenger/MessagesController;->getInstance()Lorg/telegram/messenger/MessagesController;

    move-result-object v7

    iget-object v7, v7, Lorg/telegram/messenger/MessagesController;->dialogsAdminSuperGroups:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    invoke-static {v6, v7}, Lorg/telegram/ui/PlusChatsStatsActivity;->access$1002(Lorg/telegram/ui/PlusChatsStatsActivity;I)I

    .line 311
    iget-object v6, p0, Lorg/telegram/ui/PlusChatsStatsActivity$2;->this$0:Lorg/telegram/ui/PlusChatsStatsActivity;

    invoke-static {}, Lorg/telegram/messenger/MessagesController;->getInstance()Lorg/telegram/messenger/MessagesController;

    move-result-object v7

    iget-object v7, v7, Lorg/telegram/messenger/MessagesController;->dialogsAdminChannels:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    invoke-static {v6, v7}, Lorg/telegram/ui/PlusChatsStatsActivity;->access$1102(Lorg/telegram/ui/PlusChatsStatsActivity;I)I

    .line 313
    iget-object v6, p0, Lorg/telegram/ui/PlusChatsStatsActivity$2;->this$0:Lorg/telegram/ui/PlusChatsStatsActivity;

    invoke-static {v6}, Lorg/telegram/ui/PlusChatsStatsActivity;->access$1200(Lorg/telegram/ui/PlusChatsStatsActivity;)V

    .line 314
    iget-object v6, p0, Lorg/telegram/ui/PlusChatsStatsActivity$2;->this$0:Lorg/telegram/ui/PlusChatsStatsActivity;

    invoke-static {v6}, Lorg/telegram/ui/PlusChatsStatsActivity;->access$1300(Lorg/telegram/ui/PlusChatsStatsActivity;)Lorg/telegram/ui/PlusChatsStatsActivity$ListAdapter;

    move-result-object v6

    if-eqz v6, :cond_8

    .line 315
    iget-object v6, p0, Lorg/telegram/ui/PlusChatsStatsActivity$2;->this$0:Lorg/telegram/ui/PlusChatsStatsActivity;

    invoke-static {v6}, Lorg/telegram/ui/PlusChatsStatsActivity;->access$1300(Lorg/telegram/ui/PlusChatsStatsActivity;)Lorg/telegram/ui/PlusChatsStatsActivity$ListAdapter;

    move-result-object v6

    invoke-virtual {v6}, Lorg/telegram/ui/PlusChatsStatsActivity$ListAdapter;->notifyDataSetChanged()V

    .line 319
    :cond_8
    return-void
.end method
